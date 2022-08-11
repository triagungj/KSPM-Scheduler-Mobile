import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ButtomButtonPagination extends StatelessWidget {
  const ButtomButtonPagination({
    Key? key,
    this.labelPrev,
    this.labelNext,
    this.onPrev,
    this.onNext,
  }) : super(key: key);

  final String? labelPrev;
  final String? labelNext;
  final void Function()? onPrev;
  final void Function()? onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (labelPrev != null)
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: onPrev,
              child: Row(
                children: [
                  const Icon(
                    FluentIcons.arrow_left_16_regular,
                  ),
                  const SizedBox(width: 10),
                  Text(labelPrev!),
                ],
              ),
            ),
          ),
        if (labelNext != null)
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: onNext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(labelNext!),
                  const SizedBox(width: 10),
                  const Icon(
                    FluentIcons.arrow_right_16_regular,
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
