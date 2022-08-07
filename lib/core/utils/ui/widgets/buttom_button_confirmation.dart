import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ConfirmationButtomButton extends StatelessWidget {
  const ConfirmationButtomButton({
    Key? key,
    this.labelLeft,
    this.labelRight,
    this.onPressedLeftButton,
    this.onPressedRightButton,
  }) : super(key: key);

  final String? labelLeft;
  final String? labelRight;
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
              ),
              onPressed: onPressedLeftButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: onPressedRightButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(labelRight ?? 'Ajukan Jadwal'),
                  const SizedBox(width: 10),
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
