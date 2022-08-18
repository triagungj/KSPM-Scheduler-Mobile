import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/data_sources/profile_remote_data_source.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';
import 'package:kspm_scheduler_mobile/domain/profile/repositories/profile_repository.dart';

const errorMsg = 'Gagal terhubung ke server';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(NoParams noParams) async {
    try {
      final remoteGetProfile = await remoteDataSource.getProfile(noParams);

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
}
