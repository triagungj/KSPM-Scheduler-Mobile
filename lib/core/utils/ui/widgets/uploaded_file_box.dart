import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class UploadedFileBox extends StatelessWidget {
  const UploadedFileBox({
    Key? key,
    required this.nameFile,
    this.onDismiss,
    this.onTap,
  }) : super(key: key);

  final String nameFile;
  final void Function()? onTap;
  final void Function()? onDismiss;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 12,
          ),
          child: Row(
            children: [
              Icon(
                FluentIcons.document_pdf_16_filled,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  nameFile,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        overflow: TextOverflow.ellipsis,
                      ),
                  maxLines: 1,
                ),
              ),
              IconButton(
                onPressed: onDismiss,
                icon: Icon(
                  FluentIcons.dismiss_12_regular,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
