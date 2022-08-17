import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ButtomButtonConfirmation extends StatelessWidget {
  const ButtomButtonConfirmation({
    Key? key,
    this.labelLeft,
    this.labelRight,
    this.onPressedLeftButton,
    this.onPressedRightButton,
    this.leftWidget,
    this.rightWidget,
    this.primaryLeft,
    this.primaryRight,
  }) : super(key: key);

  final String? labelLeft;
  final String? labelRight;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? primaryLeft;
  final Color? primaryRight;
  final void Function()? onPressedLeftButton;
  final void Function()? onPressedRightButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                primary: primaryLeft,
              ),
              onPressed: onPressedLeftButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leftWidget ??
                      const Icon(
                        FluentIcons.save_16_regular,
                      ),
                  const SizedBox(width: 10),
                  Text(labelLeft ?? 'Simpan'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                primary: primaryRight,
              ),
              onPressed: onPressedRightButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(labelRight ?? 'Ajukan Jadwal'),
                  const SizedBox(width: 20),
                  rightWidget ??
                      const Icon(
                        FluentIcons.checkmark_16_filled,
                      )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
