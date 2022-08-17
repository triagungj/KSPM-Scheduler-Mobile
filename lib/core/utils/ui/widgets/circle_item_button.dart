import 'package:flutter/material.dart';

class CircleItemButton extends StatelessWidget {
  const CircleItemButton({
    Key? key,
    required this.label,
    required this.count,
    required this.iconData,
    required this.componentColor,
    this.onTap,
    this.labelColor,
  }) : super(key: key);

  final String label;
  final int count;
  final IconData iconData;
  final Color componentColor;
  final Color? labelColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.surfaceVariant,
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 28,
                    color: componentColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: componentColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: labelColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
          )
        ],
      ),
    );
  }
}
