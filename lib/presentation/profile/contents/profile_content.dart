import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/change_password_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/edit_profile_page.dart';
import 'package:varx_design_system/varx_design_system.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final sharedPref = sl<SharedPrefs>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                  'Tri Agung Jiwandono',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  'Ketua Umum',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'P5180411200',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
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
                await sharedPref.clearAll();
                await Get.offAllNamed<void>(LoginPage.route);
              },
            ),
          ),
        ),
      ],
    );
  }
}
