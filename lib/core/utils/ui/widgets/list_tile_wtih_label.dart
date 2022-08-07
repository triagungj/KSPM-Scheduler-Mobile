import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';

class ListTileWithLabel extends StatelessWidget {
  const ListTileWithLabel({
    Key? key,
    required this.label,
    required this.listSubTitle,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final List<String> listSubTitle;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TileLabel(label: label),
          Column(
            children: List.generate(
              listSubTitle.length,
              (index) => TileItem(
                title: listSubTitle[index],
                onTap: () => onTap,
              ),
            ),
          )
        ],
      ),
    );
  }
}
