import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
  }) : super(key: key);

  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onInverseSurface,
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () => Get.toNamed<void>(
          InfoDetailPage.route,
          arguments: Info(
            title: title,
            description: description,
            date: date,
          ),
        ),
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
                      date,
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
