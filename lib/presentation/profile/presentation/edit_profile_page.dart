import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/contents/edit_profice_content.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/cubit/profile_cubit.dart';
import 'package:varx_design_system/themes/varx_color.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
    this.isNewAccount = false,
  }) : super(key: key);

  final bool? isNewAccount;

  static const String route = '/editProfilePage';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _EditProfilePageState extends State<EditProfilePage> {
  final profileCubit = sl<ProfileCubit>();

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final phoneController = TextEditingController();
  final jabatanNotifier = ValueNotifier<String?>(null);

  final listJabatanNotifier = ValueNotifier<List<JabatanDataEntity>>([]);
  final avatarUrlNotifier = ValueNotifier<String?>(null);
  final avatarFileNotifier = ValueNotifier<File?>(null);
  String dropdownValue = list.first;

  void refresh() {
    getListJabatan();
    getProfile();
  }

  Future<void> getListJabatan() async {
    await profileCubit.getListJabatan();
  }

  Future<void> getProfile() async {
    await profileCubit.getProfile();
  }

  @override
  void initState() {
    super.initState();
    refresh();
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
              avatarUrlNotifier.value = state.data.avatarUrl;
              numberController.text = state.data.memberId ?? '';
              jabatanNotifier.value = state.data.jabatanId;
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
          if (state is SuccessGetListJabatanState) {
            listJabatanNotifier.value = state.data;
          }
          if (state is SuccessEditProfileState) {
            Get.snackbar(
              'Success',
              state.data.message,
              backgroundColor: VarxColor.success60,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
            Get.offAllNamed<void>(
              NavigationPage.route,
              arguments: widget.isNewAccount ?? false ? 0 : 3,
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
                RefreshIndicator(
                  onRefresh: () async => refresh(),
                  child: ListView(
                    children: [
                      const SizedBox(height: 15),
                      if (state is FailureGetListJabatanState)
                        Column(
                          children: [
                            SizedBox(height: Get.height * 0.2),
                            const ServerExceptionWidget(),
                          ],
                        )
                      else
                        EditProfileContent(
                          nameController: nameController,
                          numberController: numberController,
                          phoneController: phoneController,
                          jabatanNotifier: jabatanNotifier,
                          avatarUrlNotifier: avatarUrlNotifier,
                          avatarFileNotifier: avatarFileNotifier,
                          listJabatanNotifier: listJabatanNotifier,
                          isPetugas: isPetugas,
                        )
                    ],
                  ),
                ),
                if (state is LoadingProfileState)
                  const Center(
                    child: LoadingWithText(),
                  ),
              ],
            ),
            bottomNavigationBar: (state is LoadingProfileState)
                ? const LinearProgressIndicator()
                : ButtomButtonConfirmation(
                    labelLeft: 'Kembali',
                    leftWidget: const Icon(FluentIcons.arrow_left_24_filled),
                    onPressedLeftButton: () => Get.back<void>(),
                    labelRight: 'Simpan',
                    rightWidget: const Icon(FluentIcons.save_16_regular),
                    onPressedRightButton: () {
                      profileCubit.editProfile(
                        EditProfileBody(
                          name: nameController.text,
                          phoneNumber: phoneController.text,
                          memberId: numberController.text,
                          jabatanId: jabatanNotifier.value!,
                          image: avatarFileNotifier.value != null
                              ? avatarFileNotifier.value!.path
                              : null,
                        ),
                      );
                    }),
          );
        },
      ),
    );
  }
}
