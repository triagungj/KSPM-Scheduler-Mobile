import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/responses/profile_model.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getProfile(NoParams noParams);
  Future<DefaultEntity> editProfile(EditProfileBody body);
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

  @override
  Future<DefaultEntity> editProfile(EditProfileBody body) async {
    try {
      final profileRemote = await client.post<Map<String, dynamic>>(
        ApiPath.profileEdit,
        data: body,
      );

      return DefaultModel.fromJson(profileRemote.data!);
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
