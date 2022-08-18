import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/responses/profile_model.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getProfile(NoParams noParams);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this.client);

  final Dio client;

  @override
  Future<ProfileEntity> getProfile(NoParams noParams) async {
    try {
      final profileRemote =
          await client.get<Map<String, dynamic>>(ApiPath.profile);

      return ProfileModel.fromJson(profileRemote.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
