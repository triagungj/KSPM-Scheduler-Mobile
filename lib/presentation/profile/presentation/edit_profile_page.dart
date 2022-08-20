import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/avatar_edit.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/cubit/profile_cubit.dart';
import 'package:varx_design_system/components/avatar/varx_avatar.dart';
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

  Future<void> getProfile() async {
    await profileCubit.getProfile();
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
            profileCubit.getProfile();
            Get.snackbar(
              'Success',
              state.data.message,
              backgroundColor: VarxColor.success60,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Akun'),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: VarxAvatar(
                            radius: 50,
                            name: (state is SuccessGetProfileState)
                                ? state.data.name
                                : '',
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
                ),
                if (state is LoadingProfileState) const LoadingWithText(),
              ],
            ),
            bottomNavigationBar: (state is LoadingProfileState)
                ? null
                : ButtomButtonConfirmation(
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
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
