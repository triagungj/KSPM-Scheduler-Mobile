import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/data_soruces/schedule_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_my_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

const errorMsg = 'Tidak dapat memuat data Jadwal';

class ScheduleRepositoryImpl extends ScheduleRepository {
  ScheduleRepositoryImpl(this.remoteDataSource);

  final ScheduleRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ListMyScheduleEntity>> getListMySchedule(
    NoParams noParams,
  ) async {
    try {
      final remoteGetListMySchedule =
          await remoteDataSource.getListMySchedule(noParams);

      return Right(remoteGetListMySchedule);
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
  Future<Either<Failure, ListScheduleEntity>> getListSchedule(
    NoParams noParams,
  ) async {
    try {
      final remoteGetListSchedule =
          await remoteDataSource.getListSchedule(noParams);

      return Right(remoteGetListSchedule);
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
  Future<Either<Failure, ListDetailScheduleEntity>> getListDetailSchedule(
    String id,
  ) async {
    try {
      final remoteGetListDetailSchedule =
          await remoteDataSource.getListDetailSchedule(id);

      return Right(remoteGetListDetailSchedule);
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
  Future<Either<Failure, DetailScheduleSessionEntity>> getDetailScheduleSession(
    DetailScheduleSessionBody body,
  ) async {
    try {
      final remoteGetListDetailSchedule =
          await remoteDataSource.getDetailScheduleSession(body);

      return Right(remoteGetListDetailSchedule);
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
  Future<Either<Failure, DefaultEntity>> generateSchedule(
    NoParams noParams,
  ) async {
    try {
      final remoteGenerateSchedule =
          await remoteDataSource.generateSchedule(noParams);

      return Right(remoteGenerateSchedule);
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
