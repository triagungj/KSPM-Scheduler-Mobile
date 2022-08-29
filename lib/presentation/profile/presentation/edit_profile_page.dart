import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/avatar_edit.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/bottom_sheet.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/get_images_bottomsheet.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/cubit/profile_cubit.dart';
import 'package:varx_design_system/themes/varx_color.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const String route = '/editProfilePage';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final profileCubit = sl<ProfileCubit>();

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final phoneController = TextEditingController();
  final jabatanController = TextEditingController();

  final avatarFileNotifier = ValueNotifier<File?>(null);

  Future<void> getProfile() async {
    await profileCubit.getProfile();
  }

  Future<void> _getImage(bool fromCamera) async {
    await ImagePicker()
        .pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 30,
    )
        .then((value) {
      if (value != null) {
        avatarFileNotifier.value = File(value.path);

        Get.back<void>();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPrefs = sl<SharedPrefs>();
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;

    return BlocProvider<ProfileCubit>(
      create: (context) => profileCubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (
          context,
          state,
        ) {
          if (state is SuccessGetProfileState) {
            nameController.text = state.data.name;
            phoneController.text = state.data.phoneNumber;
            if (!isPetugas) {
              numberController.text = state.data.memberId!;
              jabatanController.text = state.data.jabatan!;
            }
          }
          if (state is FailureProfileState) {
            Get.snackbar(
              'Gagal',
              state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
          }
          if (state is SuccessEditProfileState) {
            Get.snackbar(
              'Success',
              state.data.message,
              backgroundColor: VarxColor.success60,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
            Get.offAllNamed<void>(NavigationPage.route, arguments: 3);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Akun'),
            ),
            body: Stack(
              children: [
                if (state is LoadingProfileState)
                  const Center(child: CircularProgressIndicator())
                else
                  RefreshIndicator(
                    onRefresh: () async => profileCubit.getProfile(),
                    child: ListView(
                      children: [
                        if (state is FailureProfileState)
                          Column(
                            children: [
                              SizedBox(height: Get.height * 0.2),
                              const ServerExceptionWidget(),
                            ],
                          ),
                        if (state is SuccessGetProfileState)
                          Column(
                            children: [
                              ValueListenableBuilder<File?>(
                                valueListenable: avatarFileNotifier,
                                builder: (context, _value, _widget) {
                                  return AvatarEdit(
                                    name: state.data.name,
                                    imageFile: _value,
                                    profileImageUrl: state.data.avatarUrl,
                                    onEdit: () => bottomSheet(
                                      context,
                                      GetImageBottomSheet(
                                        onCamera: () => _getImage(true),
                                        onGallery: () => _getImage(false),
                                      ),
                                    ),
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
                                        controller: nameController,
                                      ),
                                      const SizedBox(height: 10),
                                      if (!isPetugas)
                                        TextFormWithLabel(
                                          label: 'Jabatan',
                                          controller: jabatanController,
                                          isEnabled: false,
                                          dropdown: true,
                                        ),
                                      const SizedBox(height: 10),
                                      if (!isPetugas)
                                        TextFormWithLabel(
                                          label: 'Nomor Anggota',
                                          controller: numberController,
                                        ),
                                      const SizedBox(height: 10),
                                      TextFormWithLabel(
                                        label: 'Nomor Whatsapp',
                                        controller: phoneController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            bottomNavigationBar: (state is SuccessGetProfileState)
                ? ButtomButtonConfirmation(
                    labelLeft: 'Kembali',
                    leftWidget: const Icon(FluentIcons.arrow_left_24_filled),
                    onPressedLeftButton: () => Get.back<void>(),
                    labelRight: 'Simpan',
                    rightWidget: const Icon(FluentIcons.save_16_regular),
                    onPressedRightButton: () => profileCubit.editProfile(
                      EditProfileBody(
                        name: nameController.text,
                        phoneNumber: phoneController.text,
                        memberId: numberController.text,
                        image: avatarFileNotifier.value != null
                            ? avatarFileNotifier.value!.path
                            : null,
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}
