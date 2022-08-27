import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> bottomSheet(BuildContext context, Widget child, {Color? bgColor}) {
  return Get.bottomSheet<void>(
    child,
    backgroundColor: bgColor ?? Theme.of(context).colorScheme.surface,
    enableDrag: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );
}
