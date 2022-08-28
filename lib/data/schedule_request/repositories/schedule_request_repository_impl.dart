import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/data_sources/schedule_request_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/requests/save_schedule_request_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/session_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';

const errorMsg = 'Gagal memuat data';

class ScheduleRequestRepositoryImpl implements ScheduleRequestRepository {
  ScheduleRequestRepositoryImpl(this.remoteDataSource);

  final ScheduleRequestRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, DefaultEntity>> saveRequestSchedule(
    SaveScheduleRequestBody body,
  ) async {
    try {
      final remoteGetProfile = await remoteDataSource.saveRequestSchedule(body);

      return Right(remoteGetProfile);
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
  Future<Either<Failure, DefaultEntity>> sendRequestSchedule(
    SaveScheduleRequestBody body,
  ) async {
    try {
      final remoteGetProfile = await remoteDataSource.saveRequestSchedule(body);

      return Right(remoteGetProfile);
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
  Future<Either<Failure, SessionEntity>> getListSession(
    NoParams noParams,
  ) async {
    try {
      final remoteSession = await remoteDataSource.getListSession(noParams);

      return Right(remoteSession);
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
  Future<Either<Failure, ScheduleRequestEntitiy>> getListMySession(
    NoParams noParams,
  ) async {
    try {
      final remoteSession = await remoteDataSource.getListMySession(noParams);

      return Right(remoteSession);
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
