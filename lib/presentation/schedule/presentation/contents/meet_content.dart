import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/list_tile_wtih_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/vertical_label.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/session_page.dart';

class MeetContent extends StatelessWidget {
  const MeetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: VerticalLabel(
              textAbove: 'Terakhir Diperbarui',
              textBelow: '22 Mei 2022',
            ),
          ),
          ListTileWithLabel(
            label: 'Jadwal Pengurus',
            listSubTitle: const [
              'Pertemuan 1',
              'Pertemuan 2',
            ],
            onTap: (index) {
              Get.toNamed<void>(SessionPage.route);
            },
          ),
          const SizedBox(height: 10),
          ListTileWithLabel(
            label: 'Jadwal Anggota',
            listSubTitle: const [
              'Pertemuan 1',
              'Pertemuan 2',
            ],
            onTap: (index) {
              Get.toNamed<void>(SessionPage.route);
            },
          ),
        ],
      ),
    );
  }
}
