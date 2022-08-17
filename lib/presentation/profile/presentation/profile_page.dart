import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/contents/profile_content.dart';
import 'package:varx_design_system/varx_design_system.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>();

    return BlocProvider<AuthBloc>(
      create: (context) => authBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthFailure) {
              Get.snackbar(
                'Gagal Logout',
                state.message,
                backgroundColor: Theme.of(context).colorScheme.error,
                colorText: Theme.of(context).colorScheme.onPrimary,
              );
            }
            if (state is LogoutSuccess) {
              Get.snackbar(
                'Success',
                state.response.message,
                backgroundColor: VarxColor.success60,
                colorText: Theme.of(context).colorScheme.onPrimary,
              );
              final sharedPrefs = sl<SharedPrefs>();
              sharedPrefs.clearAll();
              Future<void>.delayed(
                const Duration(milliseconds: 50),
                () => Get.offAllNamed<void>(LoginPage.route),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                ProfileContent(
                  bloc: authBloc,
                ),
                if (state is AuthLoading) const LoadingWithText(),
              ],
            );
          },
        ),
      ),
    );
  }
}
