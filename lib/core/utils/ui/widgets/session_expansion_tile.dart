import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/session_entitiy.dart';

class SessionExpansionTile extends StatefulWidget {
  const SessionExpansionTile({
    Key? key,
    required this.title,
    required this.listSession,
    required this.sessionNotifier,
  }) : super(key: key);

  final String title;
  final List<SessionDataResultEntity> listSession;
  final ValueNotifier<List<SessionDataResultEntity>> sessionNotifier;

  @override
  State<SessionExpansionTile> createState() => _SessionExpansionTileState();
}

class _SessionExpansionTileState extends State<SessionExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<SessionDataResultEntity>>(
        valueListenable: widget.sessionNotifier,
        builder: (context, _value, _widget) {
          return ExpansionTile(
            title: Text(widget.title),
            textColor: Theme.of(context).colorScheme.onPrimary,
            collapsedTextColor: Theme.of(context).colorScheme.onPrimary,
            iconColor: Theme.of(context).colorScheme.onPrimary,
            collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
            tilePadding: const EdgeInsets.symmetric(horizontal: 20),
            collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            children: List.generate(
              widget.listSession.length,
              (index) => TileItem(
                title: widget.listSession[index].waktu,
                color: _value.contains(widget.listSession[index])
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                icon: _value.contains(widget.listSession[index])
                    ? Icon(
                        FluentIcons.checkbox_checked_20_regular,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : const Icon(FluentIcons.checkbox_unchecked_20_regular),
                onTap: () {
                  if (_value.contains(widget.listSession[index])) {
                    setState(() {
                      _value.remove(widget.listSession[index]);
                    });
                  } else {
                    setState(() {
                      _value.add(widget.listSession[index]);
                    });
                  }
                },
              ),
            ),
          );
        });
  }
}
