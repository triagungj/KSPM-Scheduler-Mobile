import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/data_sources/validation_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

const errorMsg = 'Gagal memuat data';

class ValidationRepositoryImpl implements ValidationRepository {
  ValidationRepositoryImpl(this.remoteDataSource);

  final ValidationRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ListCountValidationEntity>> getListCountValidation(
    NoParams noParam,
  ) async {
    try {
      final remoteGetListCount = await remoteDataSource.getListCountValidation(
        noParam,
      );

      return Right(remoteGetListCount);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListValidationEntity>> getListValidation(
    ValidationTypeBody body,
  ) async {
    try {
      final remoteGetListValidation = await remoteDataSource.getListValidation(
        body,
      );

      return Right(remoteGetListValidation);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailValidationEntity>> getDetailValidation(
    String param,
  ) async {
    try {
      final remoteGetListValidation =
          await remoteDataSource.getDetailValidation(
        param,
      );

      return Right(remoteGetListValidation);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultEntity>> rejectValidation(
    RejectValidationBody body,
  ) async {
    try {
      final remoteRejectValidation = await remoteDataSource.rejectValidation(
        body,
      );

      return Right(remoteRejectValidation);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultEntity>> acceptValidation(String param) async {
    try {
      final remoteRejectValidation = await remoteDataSource.acceptValidation(
        param,
      );

      return Right(remoteRejectValidation);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
