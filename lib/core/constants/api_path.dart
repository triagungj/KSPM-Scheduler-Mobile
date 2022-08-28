class ApiPath {
  /// * AUTH
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String changePassword = '/auth/change-password';

  /// * PROFILE
  static const String profile = '/profile';
  static const String profileEdit = '/profile/edit';

  /// * SESSION

  // * REQUEST SCHEDULE
  static const String session = '/request/session';
  static const String getRequestSchedule = '/request';
  static const String saveRequestSchedule = '/request/save';
  static const String sendRequestSchedule = '/request/send';
}
