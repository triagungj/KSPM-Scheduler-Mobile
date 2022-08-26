import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/request_schedule_content.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_cubit.dart';

class RequestSchedulePage extends StatefulWidget {
  const RequestSchedulePage({Key? key}) : super(key: key);
  static const String route = '/requestSchedulePage';

  @override
  State<RequestSchedulePage> createState() => _RequestSchedulePageState();
}

class _RequestSchedulePageState extends State<RequestSchedulePage> {
  final scheduleCubit = sl<ScheduleCubit>();

  @override
  void initState() {
    super.initState();
    scheduleCubit.getListSession();
  }

  @override
  Widget build(BuildContext context) {
    final agreementNotifier = ValueNotifier<bool>(false);

    return BlocProvider<ScheduleCubit>(
      create: (context) => scheduleCubit,
      child: BlocConsumer<ScheduleCubit, ScheduleState>(
        bloc: scheduleCubit,
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
            body: (state is LoadingScheduleState)
                ? const LoadingWithText()
                : (state is SuccessGetListSessionState)
                    ? RequestScheduleContent(
                        agreementNotifier: agreementNotifier,
                        data: state.data,
                      )
                    : null,
            bottomNavigationBar: (state is LoadingWithText)
                ? null
                : ValueListenableBuilder<bool>(
                    valueListenable: agreementNotifier,
                    builder: (context, _value, _widget) {
                      return ButtomButtonConfirmation(
                        onPressedRightButton: _value ? () {} : null,
                        onPressedLeftButton: () {},
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
