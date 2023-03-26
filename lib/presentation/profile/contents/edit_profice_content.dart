import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/avatar_edit.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/bottom_sheet.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/dropdown_with_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/get_images_bottomsheet.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({
    Key? key,
    required this.nameController,
    required this.numberController,
    required this.phoneController,
    required this.jabatanNotifier,
    required this.avatarUrlNotifier,
    required this.avatarFileNotifier,
    required this.isPetugas,
    required this.listJabatanNotifier,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController phoneController;
  final ValueNotifier<String?> jabatanNotifier;
  final ValueNotifier<String?> avatarUrlNotifier;
  final ValueNotifier<File?> avatarFileNotifier;
  final ValueNotifier<List<JabatanDataEntity>> listJabatanNotifier;
  final bool isPetugas;

  @override
  State<EditProfileContent> createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> {
  Future<void> _getImage(bool fromCamera) async {
    await ImagePicker()
        .pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 30,
    )
        .then((value) {
      if (value != null) {
        widget.avatarFileNotifier.value = File(value.path);

        Get.back<void>();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<File?>(
          valueListenable: widget.avatarFileNotifier,
          builder: (context, _value, _widget) {
            return AvatarEdit(
              name: widget.nameController.text,
              imageFile: _value,
              profileImageUrl: widget.avatarUrlNotifier.value,
              onEdit: (!widget.isPetugas)
                  ? () => bottomSheet(
                        context,
                        GetImageBottomSheet(
                          onCamera: () => _getImage(true),
                          onGallery: () => _getImage(false),
                        ),
                      )
                  : null,
            );
          },
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
                  controller: widget.nameController,
                ),
                const SizedBox(height: 10),
                if (!widget.isPetugas)
                  ValueListenableBuilder<List<JabatanDataEntity>>(
                      valueListenable: widget.listJabatanNotifier,
                      builder: (context, _value, _widget) {
                        return DropdownWithLabel(
                          label: 'Jabatan',
                          value: widget.jabatanNotifier.value,
                          list: widget.listJabatanNotifier.value
                              .map<DropdownMenuItem<String>>(
                                  (JabatanDataEntity value) {
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChange: (value) {
                            widget.jabatanNotifier.value = value;
                          },
                        );
                      }),
                const SizedBox(height: 10),
                if (!widget.isPetugas)
                  TextFormWithLabel(
                    label: 'Nomor Anggota',
                    controller: widget.numberController,
                  ),
                const SizedBox(height: 10),
                TextFormWithLabel(
                  label: 'Nomor Whatsapp',
                  controller: widget.phoneController,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
