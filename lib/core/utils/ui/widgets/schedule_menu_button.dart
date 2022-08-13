import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/circle_item_button.dart';

class ScheduleMenuButton extends StatelessWidget {
  const ScheduleMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Jadwal Pengurus',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                CircleItemButton(
                  label: 'Belum Tervalidasi',
                  count: 5,
                  iconData: FluentIcons.calendar_clock_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                ),
                CircleItemButton(
                  label: 'Ditolak',
                  count: 5,
                  iconData: FluentIcons.calendar_error_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                ),
                CircleItemButton(
                  label: 'Belum Menginput',
                  count: 5,
                  iconData: FluentIcons.calendar_empty_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                ),
                CircleItemButton(
                  label: 'Tervalidasi',
                  count: 5,
                  iconData: FluentIcons.calendar_edit_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                CircleItemButton(
                  label: 'Diterima',
                  count: 5,
                  iconData: FluentIcons.calendar_empty_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                CircleItemButton(
                  label: 'Total Pengurus',
                  count: 5,
                  iconData: FluentIcons.person_circle_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
