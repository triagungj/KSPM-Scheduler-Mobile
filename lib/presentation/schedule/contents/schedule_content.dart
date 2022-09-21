import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/snackbar.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/contents/meet_content.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class ScheduleContent extends StatefulWidget {
  const ScheduleContent({
    Key? key,
    this.data,
    required this.cubit,
  }) : super(key: key);

  final ListScheduleDataEntity? data;
  final ScheduleCubit cubit;

  @override
  State<ScheduleContent> createState() => _ScheduleContentState();
}

class _ScheduleContentState extends State<ScheduleContent> {
  final sharedPrefs = sl<SharedPrefs>();
  final scheduleCubit = sl<ScheduleCubit>();

  void reschedule() {
    Get.dialog<void>(
      CustomDialog(
        confirmText: 'Atur Jadwal',
        content: const StateInfo(
          title: 'Atur Jadwal',
          type: StateInfoType.reschedule,
          subTitle: 'Akan mengatur ulang jadwal',
        ),
        onConfirm: () {
          Get.back<void>();
          scheduleCubit.generateSchedule();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;
    final isSuperUser = sharedPrefs.getBool(KeyConstants.keyIsSuperUser);

    return BlocConsumer<ScheduleCubit, ScheduleState>(
        bloc: scheduleCubit,
        listener: (context, state) {
          if (state is FailureGenerateScheduleState) {
            AppSnackbar.snackbarFailure('Gagal', state.message);
            widget.cubit.getListSchedule();
          }
          if (state is SuccessGenerateScheduleState) {
            AppSnackbar.snackbarSuccess('Berhasil', state.message);
            widget.cubit.getListSchedule();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.data != null)
                    MeetContent(
                      data: widget.data!,
                    )
                  else
                    Column(
                      children: [
                        SizedBox(height: Get.height * 0.15),
                        Center(
                          child: StateInfo(
                            type: StateInfoType.calendar,
                            title: 'Jadwal belum tersedia',
                            subTitle: isSuperUser != null &&
                                    !isSuperUser &&
                                    isPetugas
                                ? '''Kamu belum memiliki akses untuk menyusun penjadwalan. Hubungi petugas yang memiliki akses untuk menyusun penjadwalan.'''
                                : !isPetugas
                                    ? '''Pastikan kamu sudah inputkan pengajuan jadwal, sehingga jadwal kegiatan segera diterbitkan, ya!'''
                                    : '',
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 15),
                  if (isSuperUser != null && isSuperUser)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              'Lakukan perubahan Jadwal?',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 15),
                            VarxButton(
                              label: 'Atur Ulang Jadwal',
                              primary: Theme.of(context).colorScheme.primary,
                              onTap: reschedule,
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              if (state is LoadingGenerateScheduleState)
                const LinearProgressIndicator()
            ],
          );
        });
  }
}
