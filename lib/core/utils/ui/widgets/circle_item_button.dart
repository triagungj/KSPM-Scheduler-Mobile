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
          Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            margin: EdgeInsets.zero,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
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
