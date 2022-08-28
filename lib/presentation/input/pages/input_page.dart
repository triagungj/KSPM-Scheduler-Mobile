import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/input_content.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Jadwal'),
      ),
      body: BlocProvider<ScheduleRequestCubit>(
        create: (context) => scheduleRequestCubit,
        child: RefreshIndicator(
          onRefresh: getListMyScheduleRequest,
          child: BlocBuilder<ScheduleRequestCubit, ScheduleRequestState>(
              bloc: scheduleRequestCubit,
              builder: (context, state) {
                return Stack(
                  children: [
                    ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        if (state is SuccessLoadListMySessionState)
                          InputContent(
                            data: state.data,
                          ),
                        if (state is LoadingScheduleState)
                          const LinearProgressIndicator(),
                        if (state is FailureScheduleState)
                          Column(
                            children: [
                              SizedBox(height: Get.height * 0.2),
                              const ServerExceptionWidget(),
                            ],
                          )
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
