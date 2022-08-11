import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/vertical_label.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({Key? key}) : super(key: key);

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
                  textBelow: 'Pertemuan Materi 1',
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                VerticalLabel(
                  textAbove: 'Hari',
                  textBelow: 'Hari Senin',
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
                  textBelow: 'Sesi 1',
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                VerticalLabel(
                  textAbove: 'Waktu',
                  textBelow: '09:00 - 10:30',
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
