import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class GetImageBottomSheet extends StatelessWidget {
  const GetImageBottomSheet({
    super.key,
    this.onCamera,
    this.onGallery,
  });

  final void Function()? onCamera;
  final void Function()? onGallery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant,
                    child: IconButton(
                      onPressed: onCamera,
                      icon: const Icon(FluentIcons.camera_20_filled),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text('Kamera')
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant,
                    child: IconButton(
                      onPressed: onGallery,
                      icon: const Icon(FluentIcons.image_copy_20_filled),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text('Galeri')
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
