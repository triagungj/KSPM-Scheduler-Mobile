import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/cubit/profile_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/change_password_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/edit_profile_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/widgets/profile_shimmer.dart';
import 'package:varx_design_system/varx_design_system.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    Key? key,
    required this.authBloc,
    required this.profileCubit,
  }) : super(key: key);
  final AuthBloc authBloc;
  final ProfileCubit profileCubit;

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final sharedPref = sl<SharedPrefs>();

  Future<void> getProfile() async {
    await widget.profileCubit.getProfile();
  }

  @override
  void initState() {
    super.initState();
    widget.profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getProfile,
      child: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<ProfileCubit, ProfileState>(
                bloc: widget.profileCubit,
                listener: (context, state) {
                  if (state is FailureProfileState) {
                    Get.snackbar(
                      'Gagal',
                      state.message,
                      backgroundColor: Theme.of(context).colorScheme.error,
                      colorText: Theme.of(context).colorScheme.onPrimary,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SuccessGetProfileState) {
                    return profileHeader(state.data);
                  } else {
                    return const ProfileShimmer();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TileItem(
            title: 'Akun',
            onTap: () => Get.toNamed<void>(EditProfilePage.route),
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          TileItem(
            title: 'Ubah Password',
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            onTap: () => Get.toNamed<void>(ChangePasswordPage.route),
          ),
          const SizedBox(height: 30),
          TileItem(
            title: 'Logout',
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
            icon: const Icon(FluentIcons.sign_out_20_regular),
            onTap: () => Get.dialog<void>(
              CustomDialog(
                content: const StateInfo(
                  title: 'Logout dari Akun?',
                  subTitle: 'Kamu akan diarahkan menuju halaman Login',
                  type: StateInfoType.signOut,
                ),
                confirmText: 'Logout',
                onConfirm: () async {
                  Get.back<void>();
                  // final sharedPrefs = sl<SharedPrefs>();
                  // await sharedPrefs.clearAll();
                  // Future<void>.delayed(
                  //   const Duration(milliseconds: 50),
                  //   () => Get.offAllNamed<void>(LoginPage.route),
                  // );
                  widget.authBloc.add(
                    const LogoutEvent(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileHeader(ProfileDataEntity data) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 80,
            width: 80,
            child: VarxIconButton(
              iconData: FluentIcons.person_16_regular,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          data.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        Text(
          data.jabatan ?? 'Validator',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          data.memberId ?? '',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
