import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/data/info/datasources/info_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/repositories/info_repository.dart';

const errorMsg = 'Gagal terhubung ke server';

class InfoRepostioryImpl extends InfoRepository {
  InfoRepostioryImpl(this.remoteDataSource);

  final InfoRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, InfoDetailEntity>> getInfo(String id) async {
    try {
      final remoteGetInfo = await remoteDataSource.getInfo(id);

      return Right(remoteGetInfo);
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
  Future<Either<Failure, InfoEntity>> getInfoList(int page) async {
    try {
      final remoteGetInfoList = await remoteDataSource.getInfoList(page);

      return Right(remoteGetInfoList);
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
