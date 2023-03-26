import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_pagination.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/contents/session_content.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({
    Key? key,
    this.data,
    required this.initialIndex,
    required this.partisipanType,
  }) : super(key: key);

  final List<ListMeetEntity>? data;
  final int initialIndex;
  final PartisipanType partisipanType;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final scheduleCubit = sl<ScheduleCubit>();
  final currentIndex = ValueNotifier<int>(0);

  Future<void> onRefresh() async {
    await scheduleCubit.getListDetailSchedule(
      widget.data![currentIndex.value].id,
    );
  }

  @override
  void initState() {
    super.initState();
    currentIndex.value = widget.initialIndex;
    onRefresh();
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
          onRefresh: onRefresh,
          child: BlocBuilder<ScheduleCubit, ScheduleState>(
            bloc: scheduleCubit,
            builder: (context, state) {
              if (state is LoadingScheduleState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: [
                  if (state is FailureScheduleState)
                    Column(
                      children: [
                        SizedBox(height: Get.height * 0.2),
                        StateInfo(
                          type: StateInfoType.serverError,
                          title: 'Server Error',
                          subTitle: state.message,
                        ),
                      ],
                    ),
                  if (state is SuccessLoadListDetailScheduleState)
                    SessionContent(
                      title: widget.data![currentIndex.value].name,
                      data: state.data,
                      partisipanType: widget.partisipanType,
                    ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, _value, _widget) {
            return ButtomButtonPagination(
              labelPrev: widget.data!.first != widget.data![currentIndex.value]
                  ? widget.data![currentIndex.value - 1].name
                  : null,
              onPrev: widget.data!.first != widget.data![currentIndex.value]
                  ? () {
                      currentIndex.value = currentIndex.value - 1;
                      onRefresh();
                    }
                  : null,
              labelNext: widget.data!.last != widget.data![currentIndex.value]
                  ? widget.data![currentIndex.value + 1].name
                  : null,
              onNext: widget.data!.last != widget.data![currentIndex.value]
                  ? () {
                      currentIndex.value = currentIndex.value + 1;
                      onRefresh();
                    }
                  : null,
            );
          },
        ),
      ),
    );
  }
}
