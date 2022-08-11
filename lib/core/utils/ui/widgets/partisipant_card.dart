import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:varx_design_system/varx_design_system.dart';

class PartisipantCard extends StatelessWidget {
  const PartisipantCard({
    Key? key,
    required this.textName,
    required this.textPosition,
    required this.textNumber,
    required this.phoneNumber,
  }) : super(key: key);

  final String textName;
  final String textPosition;
  final String textNumber;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              VarxAvatar(
                name: textName,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textName,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      textPosition,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    Text(
                      textNumber,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _launchInBrowser(
                  phoneNumber,
                ),
                icon: Icon(
                  FluentIcons.chat_32_filled,
                  size: 36,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String phoneNumber) async {
    try {
      await launchUrl(
        Uri(
          scheme: 'https',
          host: 'api.whatsapp.com',
          path: 'send',
          query: 'phone=$phoneNumber',
        ),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      rethrow;
    }
  }
}
