import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/responses/jabatan_model.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/responses/profile_model.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getProfile(NoParams noParams);
  Future<DefaultEntity> editProfile(EditProfileBody body);
  Future<JabatanEntity> getListJabatan(NoParams noParams);
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
    final data = FormData.fromMap(<String, dynamic>{
      'image': body.image != null
          ? await MultipartFile.fromFile(
              body.image!,
              filename: 'avatar',
            )
          : null,
      'name': body.name,
      'jabatan_id': body.jabatanId,
      'phone_number': body.phoneNumber,
      'member_id': body.memberId,
    });

    try {
      final profileRemote = await client.post<Map<String, dynamic>>(
        ApiPath.profileEdit,
        data: data,
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

  @override
  Future<JabatanEntity> getListJabatan(NoParams noParams) async {
    try {
      final jabatanRemote =
          await client.get<Map<String, dynamic>>(ApiPath.jabatans);

      return JabatanModel.fromJson(jabatanRemote.data!);
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
