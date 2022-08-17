import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/contents/meet_content.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class ScheduleContent extends StatefulWidget {
  const ScheduleContent({
    Key? key,
    required this.scheduleEmpty,
  }) : super(key: key);

  final bool scheduleEmpty;

  @override
  State<ScheduleContent> createState() => _ScheduleContentState();
}

class _ScheduleContentState extends State<ScheduleContent> {
  final sharedPrefs = sl<SharedPrefs>();

  void reschedule() {
    Get.dialog<void>(
      CustomDialog(
        confirmText: 'Atur Jadwal',
        content: const StateInfo(
          title: 'Atur Jadwal',
          type: StateInfoType.reschedule,
          subTitle: 'Akan mengatur ulang jadwal',
        ),
        onConfirm: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;
    final isSuperUser = sharedPrefs.getBool(KeyConstants.keyIsSuperUser);

    if (!widget.scheduleEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MeetContent(),
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
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: Get.height * 1 / 4),
        Center(
          child: StateInfo(
            type: StateInfoType.calendar,
            title: 'Jadwal belum tersedia',
            subTitle: isSuperUser != null && !isSuperUser && isPetugas
                ? '''Kamu belum memiliki akses untuk menyusun penjadwalan. Hubungi petugas yang memiliki akses untuk menyusun penjadwalan.'''
                : !isPetugas
                    ? '''Pastikan kamu sudah inputkan pengajuan jadwal, sehingga jadwal kegiatan segera diterbitkan, ya!'''
                    : '',
          ),
        ),
        if (isSuperUser != null && isSuperUser && isPetugas)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: reschedule,
              child: const Text('Atur Jadwal Otomatis'),
            ),
          ),
      ],
    );
  }
}
