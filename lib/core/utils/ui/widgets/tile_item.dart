import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    Key? key,
    required this.title,
    this.icon,
    this.iconData,
    this.textStyle,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Widget? icon;
  final IconData? iconData;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textStyle ??
                    Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
              ),
              if (icon != null)
                icon!
              else
                Icon(iconData ?? FluentIcons.chevron_right_16_regular)
            ],
          ),
        ),
      ),
    );
  }
}
