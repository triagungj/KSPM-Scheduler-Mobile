import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/avatar_edit.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const String route = '/editProfilePage';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final phoneController = TextEditingController();
  final jabatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    jabatanController.text = 'Ketua Umum';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: AvatarEdit(
                    name: 'Tri Agung Jiwandono',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ColoredBox(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormWithLabel(
                      label: 'Nama Lengkap',
                      controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    TextFormWithLabel(
                      label: 'Jabatan',
                      controller: jabatanController,
                      isEnabled: false,
                      dropdown: true,
                    ),
                    const SizedBox(height: 10),
                    TextFormWithLabel(
                      label: 'Nomor Anggota',
                      controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    TextFormWithLabel(
                      label: 'Nomor Whatsapp',
                      controller: nameController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomButtonConfirmation(
        labelLeft: 'Kembali',
        leftWidget: const Icon(FluentIcons.arrow_left_24_filled),
        onPressedLeftButton: () => Get.back<void>(),
        labelRight: 'Simpan',
        rightWidget: const Icon(FluentIcons.save_16_regular),
        onPressedRightButton: () => Get.back<void>(),
      ),
    );
  }
}
