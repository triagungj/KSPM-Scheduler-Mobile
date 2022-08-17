import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/auth/entities/entities.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBody body);
  Future<DefaultEntity> requestLogout(NoParams noParams);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> requestLogin(LoginBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.login,
        data: body.toJson(),
      );
      
      

      return LoginModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
  
  @override
  Future<DefaultEntity> requestLogout(NoParams noParams) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.logout,
      );

      return DefaultModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
