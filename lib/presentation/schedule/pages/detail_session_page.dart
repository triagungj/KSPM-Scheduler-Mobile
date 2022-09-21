import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_pagination.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/contents/detail_session_content.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';

class DetailSessionPage extends StatefulWidget {
  const DetailSessionPage({
    Key? key,
    required this.id,
    required this.partisipanType,
  }) : super(key: key);

  final int id;
  final PartisipanType partisipanType;

  @override
  State<DetailSessionPage> createState() => _DetailSessionPageState();
}

class _DetailSessionPageState extends State<DetailSessionPage> {
  final scheduleCubit = sl<ScheduleCubit>();

  Future<void> getDetailScheduleSession() async {
    await scheduleCubit.getDetailScheduleSession(DetailScheduleSessionBody(
      partisipanType: widget.partisipanType,
      sessionId: widget.id,
    ));
  }

  @override
  void initState() {
    super.initState();
    getDetailScheduleSession();
  }

  @override
  Widget build(BuildContext context) {
    final title = (widget.partisipanType == PartisipanType.anggota)
        ? 'Jadwal Anggota'
        : 'Jadwal Pengurus';

    return BlocProvider<ScheduleCubit>(
      create: (context) => scheduleCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: RefreshIndicator(
          onRefresh: getDetailScheduleSession,
          child: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
              if (state is LoadingScheduleState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: [
                    if (state is FailureScheduleState)
                      Column(
                        children: [
                          SizedBox(height: getx.Get.height * 0.2),
                          StateInfo(
                            type: StateInfoType.serverError,
                            title: 'Server Error',
                            subTitle: state.message,
                          ),
                        ],
                      ),
                    if (state is SuccessLoadDetailScheduleSessionState)
                      DetailSessionContent(
                        data: state.data,
                      ),
                  ],
                );
              }
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<ScheduleCubit, ScheduleState>(
          bloc: scheduleCubit,
          builder: (context, state) {
            if (state is SuccessLoadDetailScheduleSessionState) {
              return ButtomButtonPagination(
                labelPrev: state.data.prev ? 'Sebelumnya' : null,
                onPrev: state.data.prev
                    ? () => getx.Get.off<void>(
                          DetailSessionPage(
                            id: widget.id - 1,
                            partisipanType: widget.partisipanType,
                          ),
                          preventDuplicates: false,
                          transition: getx.Transition.leftToRight,
                        )
                    : null,
                labelNext: state.data.next ? 'Selanjutnya' : null,
                onNext: state.data.next
                    ? () => getx.Get.off<void>(
                          DetailSessionPage(
                            id: widget.id + 1,
                            partisipanType: widget.partisipanType,
                          ),
                          preventDuplicates: false,
                          transition: getx.Transition.rightToLeft,
                        )
                    : null,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
