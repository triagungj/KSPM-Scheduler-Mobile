import 'package:get_it/get_it.dart';
import 'package:kspm_scheduler_mobile/core/env/env_config.dart';
import 'package:kspm_scheduler_mobile/core/network/http_client.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/notification.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_local_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/repositories/repository_impl.dart';
import 'package:kspm_scheduler_mobile/domain/auth/repositories/repository.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/logout_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [init]
  ///component primay like [storage] and [environment]
  final config = EnvConfig.getInstance();
  final prefs = await SharedPrefs.getInstance();

  sl.registerLazySingleton(() => prefs);

  /// [flavor]
  /// implementation flavor with different [environment] both ios and android
  sl.registerLazySingleton(() => config);

  //! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(sl(),sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  // Network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerLazySingleton(() => HttpClient(config: sl(), preferences: sl()));

  sl.registerLazySingleton(NotificationService.new);

  //! External
}
