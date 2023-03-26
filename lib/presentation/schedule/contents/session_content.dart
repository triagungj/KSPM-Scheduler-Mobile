import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/list_tile_wtih_label.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/pages/detail_session_page.dart';

class SessionContent extends StatelessWidget {
  const SessionContent({
    Key? key,
    required this.title,
    required this.data,
    required this.partisipanType,
  }) : super(key: key);

  final String title;
  final List<DetailScheduleEntity> data;
  final PartisipanType partisipanType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          Column(
            children: List.generate(
              data.length,
              (index) {
                final listString = <String>[];
                for (final session in data[index].listSession) {
                  listString.add('${session.name} (${session.waktu})');
                }

                return ListTileWithLabel(
                  label: 'Hari ${data[index].hari.name.capitalizeFirst}',
                  listSubTitle: listString,
                  onTap: (sessionIndex) {
                    Get.to<void>(
                      () => DetailSessionPage(
                        id: data[index].listSession[sessionIndex].id,
                        partisipanType: partisipanType,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
