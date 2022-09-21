import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/configs/routes/routes.dart';
import 'package:kspm_scheduler_mobile/core/configs/themes/custom_theme.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstants.keyAccessToken);

    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    String initialRoute() {
      if (isLogin) {
        return NavigationPage.route;
      } else {
        return LoginPage.route;
      }
    }

    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.lightTheme,
      navigatorObservers: [routeObserver],
      initialRoute: initialRoute(),
      getPages: Routes.page.map((page) => page).toList(),
    );
  }
}
