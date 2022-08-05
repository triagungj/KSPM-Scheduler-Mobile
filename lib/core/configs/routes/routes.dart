import 'package:get/route_manager.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';

class Routes {
  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: NavigationPage.route,
      page: () => const NavigationPage(),
    ),
    GetPage<void>(
      name: LoginPage.route,
      page: LoginPage.new,
    ),
    GetPage<void>(
      name: InfoPage.route,
      page: InfoPage.new,
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: InfoDetailPage.route,
      page: () => InfoDetailPage(
        info: Get.arguments as Info,
      ),
      transition: Transition.cupertino,
    ),
  ];
}
