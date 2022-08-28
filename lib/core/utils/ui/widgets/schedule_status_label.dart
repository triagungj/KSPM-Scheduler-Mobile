import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ScheduleStatusLabel extends StatelessWidget {
  const ScheduleStatusLabel({
    Key? key,
    required this.type,
  }) : super(key: key);

  final ScheduleStatusType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (type == ScheduleStatusType.requested)
          Text(
            'Jadwal Sedia kamu sedang diajukan',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        if (type == ScheduleStatusType.accepted)
          Text(
            'Jadwal Sedia kamu telah disetujui',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        if (type == ScheduleStatusType.rejected)
          Text(
            'Jadwal Sedia kamu ditolak',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        if (type == ScheduleStatusType.requested)
          Icon(
            FluentIcons.clock_32_regular,
            size: 36,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        if (type == ScheduleStatusType.accepted)
          Icon(
            FluentIcons.checkmark_circle_32_filled,
            size: 36,
            color: Theme.of(context).colorScheme.primary,
          ),
        if (type == ScheduleStatusType.rejected)
          Icon(
            FluentIcons.dismiss_circle_32_filled,
            size: 36,
            color: Theme.of(context).colorScheme.error,
          ),
      ],
    );
  }
}
