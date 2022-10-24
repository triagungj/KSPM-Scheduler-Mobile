import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/assets_constants.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/loading_with_text.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/snackbar.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/widgets/login_form.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.authBloc}) : super(key: key);

  final AuthBloc authBloc;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Key
  final _formLoginKey = GlobalKey<FormState>();

  Future<void> _directContact(String phoneNumber) async {
    try {
      await launchUrl(
        Uri(
          scheme: 'https',
          host: 'api.whatsapp.com',
          path: 'send',
          query: 'phone=$phoneNumber',
        ),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          AppSnackbar.snackbarFailure('Login Gagal', state.message);
        }
        if (state is AuthSuccess) {
          AppSnackbar.snackbarSuccess('Login ', state.data.message);
        }

        if (state is AuthSuccess) {
          Get.offAllNamed<void>(NavigationPage.route);
        }

        if (state is GetAdminContactSuccess) {
          _directContact(state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: size.height / 4,
                        child: Center(
                          child: Image.asset(
                            AssetsConstants.logoLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      FormLogin(
                        formLoginKey: _formLoginKey,
                        usernameController: usernameController,
                        passwordController: passwordController,
                        onLogin: onLogin,
                      ),
                      contactDirect(),
                    ],
                  ),
                ),
              ),
            ),
            if (state is AuthLoading) const LoadingWithText(),
          ],
        );
      },
    );
  }

  Widget contactDirect() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Belum punya akun? ',
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: 'Hubungi Admin ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: 'Klik disini',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                widget.authBloc.add(const GetAdminContactEvent());
              },
          ),
        ],
      ),
    );
  }

  void onLogin() {
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();

      final body = LoginBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      widget.authBloc.add(LoginEvent(body));
    }
  }
}
