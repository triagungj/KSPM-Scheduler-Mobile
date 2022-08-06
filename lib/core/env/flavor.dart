import 'package:kspm_scheduler_mobile/core/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'http://192.168.1.18:8000',
      apiSentry: '',
    );
  }
  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://api.stg.kspm.triagungj.site',
      apiSentry: '',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://api.kspm.triagungj.site',
      apiSentry: '',
    );
  }
}
