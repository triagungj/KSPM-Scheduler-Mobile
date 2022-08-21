import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/datasources/schedule_remote_datasource.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

const errorMsg = 'Gagal terhubung ke server';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this.datasource);

  final ScheduleRemoteDatasource datasource;

  @override
  Future<Either<Failure, SessionEntity>> getListSession(
    NoParams noParams,
  ) async {
    try {
      final remoteSession = await datasource.getListSession(noParams);

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
