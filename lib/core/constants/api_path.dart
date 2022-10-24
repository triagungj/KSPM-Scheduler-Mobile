class ApiPath {
  /// * AUTH
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String changePassword = '/auth/change-password';
  static const String contact = '/auth/contact';

  /// * PROFILE
  static const String profile = '/profile';
  static const String profileEdit = '/profile/edit';

  /// * INFO
  static const String info = '/news';

  // * REQUEST SCHEDULE
  static const String session = '/request/session';
  static const String getRequestSchedule = '/request';
  static const String saveRequestSchedule = '/request/save';
  static const String sendRequestSchedule = '/request/send';
  static const String postponeScheduleRequest = '/request/postpone';

  // * VALIDATION
  static const String validation = '/validation';
  static const String getListCountValidation = '$validation/count';
  static const String getListValidation = '$validation/list';
  static const String rejectValidation = '$validation/reject';
  static const String acceptValidation = '$validation/accept';

  // * SCHEDULE
  static const String schedule = '/schedule';
  static const String scheduleList = '$schedule/list';
  static const String scheduleListDetail = '$schedule/session';
  static const String scheduleDetail = '$schedule/detail';
  static const String scheduleGenerate = '$schedule/generate';
}
