import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  static const String route = '/changePasswordPage';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: const [
            TextFormWithLabel(
              label: 'Password Lama',
              obsecureText: true,
              action: TextInputAction.next,
            ),
            SizedBox(height: 15),
            TextFormWithLabel(
              label: 'Password Lama',
              obsecureText: true,
              action: TextInputAction.next,
            ),
            SizedBox(height: 15),
            TextFormWithLabel(
              label: 'Password Lama',
              obsecureText: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConfirmationButtomButton(
        labelLeft: 'Kembali',
        leftWidget: const Icon(FluentIcons.arrow_left_24_filled),
        onPressedLeftButton: () => Get.back<void>(),
        labelRight: 'Ubah Passowrd',
        rightWidget: const Icon(FluentIcons.key_16_regular),
        onPressedRightButton: () => Get.back<void>(),
      ),
    );
  }
}
