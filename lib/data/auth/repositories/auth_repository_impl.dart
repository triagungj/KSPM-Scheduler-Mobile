import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_local_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/datasources/auth_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/auth/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/auth/repositories/repository.dart';

const errorMsg = 'Gagal terhubung ke server';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body) async {
    try {
      final remoteLogin = await remoteDataSource.requestLogin(body);
      final sharedPrefs = sl<SharedPrefs>();
      await localDataSource.saveToken(remoteLogin.token);
      await sharedPrefs.putBool(
        KeyConstants.keyIsPetugas,
        remoteLogin.isPetugas,
      );

      if (remoteLogin.isSuperuser != null) {
        await sharedPrefs.putBool(
          KeyConstants.keyIsSuperUser,
          remoteLogin.isSuperuser!,
        );
      }

      return Right(remoteLogin);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultEntity>> requestLogout(
    NoParams noParams,
  ) async {
    try {
      final remoteLogout = await remoteDataSource.requestLogout(noParams);

      return Right(remoteLogout);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultEntity>> changePassword(
      ChangePasswordBody body) async {
    try {
      final remoteChangePassword = await remoteDataSource.changePassword(body);

      return Right(remoteChangePassword);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
