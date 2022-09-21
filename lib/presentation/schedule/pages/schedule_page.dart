import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/contents/schedule_content.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final sharedPrefs = sl<SharedPrefs>();
  final scheduleCubit = sl<ScheduleCubit>();
  @override
  void initState() {
    super.initState();
    scheduleCubit.getListSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleCubit>(
      create: (context) => scheduleCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal'),
        ),
        body: BlocBuilder<ScheduleCubit, ScheduleState>(
          bloc: scheduleCubit,
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                await scheduleCubit.getListSchedule();
              },
              child: ListView(
                children: [
                  if (state is LoadingScheduleState)
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.4,
                        ),
                        const CircularProgressIndicator(),
                      ],
                    ),
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
                  if (state is SuccessLoadListScheduleState)
                    ScheduleContent(data: state.data, cubit: scheduleCubit)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
