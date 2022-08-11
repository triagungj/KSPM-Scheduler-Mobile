import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final sharedPrefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal'),
      ),
      // body: const MeetContent(),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            SizedBox(height: Get.height * 1 / 4),
            Center(
              child: StateInfo(
                type: StateInfoType.calendar,
                title: 'Jadwal belum tersedia',
                subTitle: isPetugas
                    ? '''Kamu belum memiliki akses untuk menyusun penjadwalan. Hubungi petugas yang memiliki akses untuk menyusun penjadwalan.'''
                    : '''Pastikan kamu sudah inputkan pengajuan jadwal, sehingga jadwal kegiatan segera diterbitkan, ya!''',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
