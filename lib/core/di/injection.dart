import 'package:get_it/get_it.dart';
import 'package:kspm_scheduler_mobile/core/env/env_config.dart';
import 'package:kspm_scheduler_mobile/core/network/http_client.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/notification.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_local_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/repositories/repository_impl.dart';
import 'package:kspm_scheduler_mobile/data/profile/data_sources/profile_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/profile/repositories/profile_repository_impl.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/data_sources/schedule_request_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/repositories/schedule_request_repository_impl.dart';
import 'package:kspm_scheduler_mobile/domain/auth/repositories/repository.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/change_password_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/logout_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/repositories/profile_repository.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/edit_profile_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/get_profile_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/get_list_my_session_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/get_list_session_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/save_schedule_request_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/send_schedule_request_usecase.dart';
import 'package:kspm_scheduler_mobile/presentation/auth/blocs/auth_bloc.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/cubit/profile_cubit.dart';

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
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory(() => ProfileCubit(sl(), sl()));
  sl.registerFactory(() => ScheduleRequestCubit(sl(), sl(), sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  sl.registerLazySingleton(() => GetProfileUsecase(sl()));
  sl.registerLazySingleton(() => EditProfileUsecase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUsecase(sl()));

  sl.registerLazySingleton(() => GetListSessionUsecase(sl()));
  sl.registerLazySingleton(() => GetListMySessionUsecase(sl()));
  sl.registerLazySingleton(() => SaveScheduleRequestUsecase(sl()));
  sl.registerLazySingleton(() => SendScheduleRequestUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ScheduleRequestRepository>(
    () => ScheduleRequestRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ScheduleRequestRemoteDataSource>(
      () => ScheduleRequestRemoteDataSourceImpl(sl()));

  // Network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerLazySingleton(() => HttpClient(config: sl(), preferences: sl()));

  sl.registerLazySingleton(NotificationService.new);

  //! External
}
