import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/request_schedule_content.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';

class RequestSchedulePage extends StatefulWidget {
  const RequestSchedulePage({Key? key}) : super(key: key);
  static const String route = '/requestSchedulePage';

  @override
  State<RequestSchedulePage> createState() => _RequestSchedulePageState();
}

class _RequestSchedulePageState extends State<RequestSchedulePage> {
  final scheduleRequestCubit = sl<ScheduleRequestCubit>();

  @override
  void initState() {
    super.initState();
    scheduleRequestCubit.getListSession();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleRequestCubit>(
      create: (context) => scheduleRequestCubit,
      child: BlocConsumer<ScheduleRequestCubit, ScheduleRequestState>(
        bloc: scheduleRequestCubit,
        listener: (context, state) {
          if (state is FailureScheduleRequestState) {
            Get.snackbar(
              'Gagal',
              state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pengajuan Jadwal'),
            ),
            body: RefreshIndicator(
              onRefresh: () async => scheduleRequestCubit.getListSession(),
              child: Stack(
                children: [
                  if (state is SuccessGetListSessionState)
                    RequestScheduleContent(
                      data: state.data,
                    ),
                  if (state is LoadingScheduleRequestState)
                    const Center(child: CircularProgressIndicator()),
                  if (state is FailureScheduleRequestState)
                    ListView(
                      children: [
                        SizedBox(height: Get.height * 0.2),
                        const ServerExceptionWidget(),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
