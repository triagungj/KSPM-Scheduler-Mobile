import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/icon_button_with_label.dart';

class ScheduleInfoCard extends StatelessWidget {
  const ScheduleInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Jadwal Pengurus',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.calendar_clock_16_filled,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onTap: () {},
                  label: 'Belum Divalidasi',
                ),
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.calendar_error_20_filled,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onTap: () {},
                  label: 'Ditolak',
                ),
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.calendar_empty_16_filled,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onTap: () {},
                  label: 'Belum Menginput',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.calendar_edit_16_filled,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {},
                  label: 'Belum Divalidasi',
                ),
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.calendar_checkmark_16_filled,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {},
                  label: 'Ditolak',
                ),
                IconButtonWithLabel(
                  count: '5',
                  icon: Icon(
                    FluentIcons.person_24_filled,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {},
                  label: 'Belum Menginput',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
