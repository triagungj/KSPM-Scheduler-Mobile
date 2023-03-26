import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/list_tile_wtih_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/vertical_label.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/pages/session_page.dart';

class MeetContent extends StatelessWidget {
  const MeetContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ListScheduleDataEntity data;

  @override
  Widget build(BuildContext context) {
    var dateTime = '';
    if (data.lastUpdate != null) {
      final validateTime = DateTime.parse('${data.lastUpdate!}Z').toLocal();
      final dateFormat = DateFormat('dd MMMM yyyy, HH:mm');
      dateTime = dateFormat.format(validateTime);
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: VerticalLabel(
              textAbove: 'Terakhir Diperbarui',
              textBelow: dateTime,
            ),
          ),
          ListTileWithLabel(
            label: 'Jadwal Pengurus',
            listSubTitle: data.listSchedule!.map((e) => e.name).toList(),
            onTap: (index) {
              Get.to<void>(
                () => SessionPage(
                  data: data.listSchedule,
                  initialIndex: index,
                  partisipanType: PartisipanType.pengurus,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          ListTileWithLabel(
            label: 'Jadwal Anggota',
            listSubTitle: data.listSchedule!.map((e) => e.name).toList(),
            onTap: (index) {
              Get.to<void>(
                () => SessionPage(
                  data: data.listSchedule,
                  initialIndex: index,
                  partisipanType: PartisipanType.anggota,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
