import 'package:get/route_manager.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/dashboard/pages/dashboard_page.dart';

class Routes {
  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: DashboardPage.route,
      page: () => const DashboardPage(),
    ),
    GetPage<void>(
      name: LoginPage.route,
      page: LoginPage.new,
    ),
  ];
}
