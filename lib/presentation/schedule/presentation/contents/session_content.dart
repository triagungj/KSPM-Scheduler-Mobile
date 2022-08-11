import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/list_tile_wtih_label.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/detail_session_page.dart';

class SessionContent extends StatelessWidget {
  const SessionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listString = [
      'Sesi 1 (09.00 - 10.30)',
      'Sesi 2 (09.00 - 10.30)',
      'Sesi 3 (09.00 - 10.30)',
      'Sesi 4 (09.00 - 10.30)',
    ];
    final listString2 = [
      'Sesi 1 (09.00 - 10.30)',
      'Sesi 2 (09.00 - 10.30)',
      'Sesi 3 (09.00 - 10.30)',
      'Sesi 4 (09.00 - 10.30)',
    ];
    final listString3 = [
      'Sesi 1 (09.00 - 10.30)',
      'Sesi 2 (09.00 - 10.30)',
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Pertemuan Materi 1',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          ListTileWithLabel(
            label: 'Hari Senin',
            listSubTitle: listString,
            onTap: (index) {
              Get.toNamed<void>(
                DetailSessionPage.route,
                arguments: 'Sesi 1',
              );
            },
          ),
          ListTileWithLabel(
            label: 'Hari Selasa',
            listSubTitle: listString2,
            onTap: (index) {
              Get.toNamed<void>(
                DetailSessionPage.route,
                arguments: 'Sesi 1',
              );
            },
          ),
          ListTileWithLabel(
            label: 'Hari Rabu',
            listSubTitle: listString3,
            onTap: (index) {
              Get.toNamed<void>(
                DetailSessionPage.route,
                arguments: 'Sesi 1',
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
