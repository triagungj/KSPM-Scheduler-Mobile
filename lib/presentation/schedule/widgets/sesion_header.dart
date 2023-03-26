import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/vertical_label.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({
    Key? key,
    required this.details,
  }) : super(key: key);

  final SessionDetailsEntity details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalLabel(
                  textAbove: 'Pertemuan',
                  textBelow: details.pertemuan,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                VerticalLabel(
                  textAbove: 'Hari',
                  textBelow: 'Hari ${details.hari.name.capitalizeFirst}',
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalLabel(
                  textAbove: 'Sesi',
                  textBelow: details.name,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                VerticalLabel(
                  textAbove: 'Waktu',
                  textBelow: details.waktu,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
