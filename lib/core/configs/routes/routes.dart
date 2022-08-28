import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/classes.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/change_password_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/edit_profile_page.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/detail_session_page.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/pages/session_page.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/detail_validation_page.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/list_validation_page.dart';

class Routes {
  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: NavigationPage.route,
      page: () => (Get.arguments == null)
        ? const NavigationPage()
        : NavigationPage(
          selectedIndex: Get.arguments as int,
        ),
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

    // Input
    GetPage<void>(
      name: RequestSchedulePage.route,
      page: RequestSchedulePage.new,
      transition: Transition.cupertino,
    ),

    // Validation
    GetPage<void>(
      name: ListValidationPage.route,
      page: () => ListValidationPage(
        validationEntity: Get.arguments as ValidationEntity,
      ),
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: DetailValidationPage.route,
      page: DetailValidationPage.new,
      transition: Transition.cupertino,
    ),

    // PROFILE
    GetPage<void>(
      name: EditProfilePage.route,
      page: EditProfilePage.new,
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: ChangePasswordPage.route,
      page: ChangePasswordPage.new,
      transition: Transition.cupertino,
    ),
  ];
}
