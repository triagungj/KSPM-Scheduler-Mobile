import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
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
          if (state is FailureScheduleState) {
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
            body: Stack(
              children: [
                if (state is SuccessGetListSessionState)
                  RequestScheduleContent(
                    data: state.data,
                  ),
                if (state is LoadingScheduleState) const LoadingWithText(),
              ],
            ),
          );
        },
      ),
    );
  }
}
