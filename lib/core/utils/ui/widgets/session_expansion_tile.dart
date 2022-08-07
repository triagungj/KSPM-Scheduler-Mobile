import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';

class SessionExpansionTile extends StatefulWidget {
  const SessionExpansionTile({
    Key? key,
    required this.title,
    required this.listSession,
  }) : super(key: key);

  final String title;
  final List<Session> listSession;
  @override
  State<SessionExpansionTile> createState() => _SessionExpansionTileState();
}

class _SessionExpansionTileState extends State<SessionExpansionTile> {
  final indexSelected = ValueNotifier<List<bool>>([]);

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.listSession.length; i++) {
      indexSelected.value.add(widget.listSession[i].sessionStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<bool>>(
        valueListenable: indexSelected,
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
                title: widget.listSession[index].sessionName,
                color: _value[index]
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                icon: (_value[index])
                    ? Icon(
                        FluentIcons.checkbox_checked_20_regular,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : const Icon(FluentIcons.checkbox_unchecked_20_regular),
                onTap: () {
                  setState(() {
                    _value[index] = !_value[index];
                  });
                },
              ),
            ),
          );
        });
  }
}

class Meet {
  Meet({
    required this.title,
    required this.listSession,
  });

  final String title;
  final List<Session> listSession;
}

class Session {
  Session({
    required this.sessionName,
    required this.sessionStatus,
  });

  final String sessionName;
  bool sessionStatus;
}
