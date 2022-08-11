import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatelessWidget {
  const IconButtonWithLabel({
    Key? key,
    this.label,
    required this.count,
    required this.icon,
    this.onTap,
    this.countColor,
  }) : super(key: key);
  final String? label;
  final String count;
  final Widget icon;
  final Color? countColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: Theme.of(context).colorScheme.surfaceVariant,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 5),
              Text(
                count,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: countColor ??
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ],
          ),
        ),
        if (label != null)
          Text(
            label!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
      ],
    );
  }
}
