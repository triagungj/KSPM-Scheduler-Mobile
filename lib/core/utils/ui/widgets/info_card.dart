import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
    required this.id,
    this.onTap,
  }) : super(key: key);

  final String id;
  final String title;
  final String date;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final validateTime = DateTime.parse(date).toLocal();
    final dateFormat = DateFormat('EEEE, dd MMM yyyy, HH:mm');
    final dateParsed = dateFormat.format(validateTime);

    return Card(
      color: Theme.of(context).colorScheme.onInverseSurface,
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  FluentIcons.info_28_filled,
                  size: 32,
                  color: Theme.of(context).cardColor,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dateParsed,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
