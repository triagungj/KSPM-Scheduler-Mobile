import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/input_content.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';

class InputSchedulePage extends StatefulWidget {
  const InputSchedulePage({Key? key}) : super(key: key);

  @override
  State<InputSchedulePage> createState() => _InputSchedulePageState();
}

class _InputSchedulePageState extends State<InputSchedulePage> {
  final scheduleRequestCubit = sl<ScheduleRequestCubit>();

  Future<void> getListMyScheduleRequest() async {
    await scheduleRequestCubit.getListMySession();
  }

  @override
  void initState() {
    super.initState();
    getListMyScheduleRequest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleRequestCubit>(
      create: (context) => scheduleRequestCubit,
      child: BlocBuilder<ScheduleRequestCubit, ScheduleRequestState>(
          bloc: scheduleRequestCubit,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Input Jadwal'),
              ),
              bottomNavigationBar: (state is LoadingScheduleState)
                  ? const LinearProgressIndicator()
                  : null,
              body: RefreshIndicator(
                  onRefresh: getListMyScheduleRequest,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      if (state is SuccessLoadListMySessionState)
                        if (state.data.status != null)
                          InputContent(
                            parentCubit: scheduleRequestCubit,
                            data: state.data,
                          )
                        else
                          emptySection(),
                      if (state is FailureScheduleState)
                        Column(
                          children: [
                            SizedBox(height: Get.height * 0.2),
                            const ServerExceptionWidget(),
                          ],
                        ),
                    ],
                  )),
            );
          }),
    );
  }

  Widget emptySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: Get.height * 1 / 5),
        const Center(
          child: StateInfo(
            type: StateInfoType.reschedule,
            title: 'Kamu belum selesai menginputkan Jadwal Sedia kamu',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () => Get.toNamed<void>(RequestSchedulePage.route),
            child: const Text('Mulai Input Jadwal'),
          ),
        ),
      ],
    );
  }
}
