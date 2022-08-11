import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:varx_design_system/components/avatar/varx_avatar.dart';

class AvatarEdit extends StatelessWidget {
  const AvatarEdit({
    Key? key,
    required this.name,
    this.onEdit,
  }) : super(key: key);

  final String name;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 100,
      child: Stack(
        children: [
          Align(
            child: SizedBox(
              height: 90,
              width: 110,
              child: VarxAvatar(
                name: name,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: IconButton(
                onPressed: onEdit,
                icon: Icon(
                  FluentIcons.edit_16_filled,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
