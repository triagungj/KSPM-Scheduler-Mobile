import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/validation_type_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/pages/login_page.dart';
import 'package:kspm_scheduler_mobile/presentation/info/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/info/pages/info_page.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/change_password_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/edit_profile_page.dart';
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
        id: Get.arguments as String,
      ),
      transition: Transition.cupertino,
    ),

    // Schedule

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
        validationTypeEntity: Get.arguments as ValidationTypeEntity,
      ),
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: DetailValidationPage.route,
      page: () => DetailValidationPage(
        scheduleRequestId: Get.arguments as String,
      ),
      transition: Transition.cupertino,
    ),

    // PROFILE
    GetPage<void>(
      name: EditProfilePage.route,
      page: () => EditProfilePage(
        isNewAccount: Get.arguments as bool?,
      ),
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: ChangePasswordPage.route,
      page: ChangePasswordPage.new,
      transition: Transition.cupertino,
    ),
  ];
}
