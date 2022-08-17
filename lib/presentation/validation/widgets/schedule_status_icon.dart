import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ScheduleStatusIcon extends StatelessWidget {
  const ScheduleStatusIcon({
    Key? key,
    required this.isAccepted,
  }) : super(key: key);

  final bool? isAccepted;

  @override
  Widget build(BuildContext context) {
    if (isAccepted != null) {
      return Column(
        children: [
          if (!isAccepted!)
            Icon(
              FluentIcons.dismiss_circle_16_filled,
              color: Theme.of(context).colorScheme.error,
            ),
          if (isAccepted!)
            Icon(
              FluentIcons.checkmark_circle_16_filled,
              color: Theme.of(context).colorScheme.primary,
            ),
          const SizedBox(height: 2),
          if (!isAccepted!)
            Text(
              'Ditolak',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          if (isAccepted!)
            Text(
              'Diterima',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
