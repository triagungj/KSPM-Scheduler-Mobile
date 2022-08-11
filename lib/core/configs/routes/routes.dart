import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/detail_session_page.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/session_page.dart';

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

    // Schedule
    GetPage<void>(
      name: SessionPage.route,
      page: SessionPage.new,
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: DetailSessionPage.route,
      page: () => DetailSessionPage(
        title: Get.arguments as String,
      ),
      transition: Transition.cupertino,
    ),
  ];
}
