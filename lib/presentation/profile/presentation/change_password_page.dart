import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/snackbar.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/text_form_with_label.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  static const String route = '/changePasswordPage';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final authBloc = sl<AuthBloc>();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            AppSnackbar.snackbarFailure('Ubah password Gagal', state.message);
          }
          if (state is ChangePasswordSuccess) {
            Get.back<void>();
            AppSnackbar.snackbarSuccess('Berhasil!', state.response.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Ubah Password'),
            ),
            body: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      TextFormWithLabel(
                        label: 'Password Lama',
                        controller: oldPasswordController,
                        obsecureText: true,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      TextFormWithLabel(
                        label: 'Password Baru',
                        controller: newPasswordController,
                        obsecureText: true,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      TextFormWithLabel(
                        label: 'Konfirmasi Password Baru',
                        controller: confirmPasswordController,
                        obsecureText: true,
                      ),
                    ],
                  ),
                ),
                if (state is AuthLoading) const LoadingWithText(),
              ],
            ),
            bottomNavigationBar: (state is AuthLoading)
                ? null
                : ButtomButtonConfirmation(
                    labelLeft: 'Kembali',
                    leftWidget: const Icon(FluentIcons.arrow_left_24_filled),
                    onPressedLeftButton: () => Get.back<void>(),
                    labelRight: 'Ubah Passowrd',
                    rightWidget: const Icon(FluentIcons.key_16_regular),
                    onPressedRightButton: () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        authBloc.add(
                          ChangePasswordEvent(
                            ChangePasswordBody(
                              oldPassword: oldPasswordController.text,
                              newPassword: confirmPasswordController.text,
                            ),
                          ),
                        );
                      } else {
                        Get.closeAllSnackbars();
                        Get.snackbar(
                          'Gagal',
                          'Password Baru harus sama!',
                          backgroundColor: Theme.of(context).colorScheme.error,
                          colorText: Theme.of(context).colorScheme.onPrimary,
                        );
                      }
                    },
                  ),
          );
        },
      ),
    );
  }
}
