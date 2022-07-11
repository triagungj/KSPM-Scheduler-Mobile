import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.sharedPrefs);

  final SharedPrefs sharedPrefs;

  @override
  Future<void> saveToken(String token) {
    return sharedPrefs.putString(KeyConstants.keyAccessToken, token);
  }
}
