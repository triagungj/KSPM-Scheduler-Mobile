import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/responses/detail_validation_model.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/responses/list_count_model.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/responses/list_validation_model.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';

abstract class ValidationRemoteDataSource {
  Future<ListCountValidationEntity> getListCountValidation(NoParams noParams);
  Future<ListValidationEntity> getListValidation(ValidationTypeBody params);
  Future<DetailValidationEntity> getDetailValidation(String id);
  Future<DefaultEntity> rejectValidation(RejectValidationBody body);
  Future<DefaultEntity> acceptValidation(String id);
}

class ValidationRemoteDataSourceImpl implements ValidationRemoteDataSource {
  ValidationRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<ListCountValidationEntity> getListCountValidation(
    NoParams noParams,
  ) async {
    try {
      final remote = await _client.get<Map<String, dynamic>>(
        ApiPath.getListCountValidation,
      );

      return ListCountValidationModel.fromJson(remote.data!);
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
  Future<ListValidationEntity> getListValidation(
    ValidationTypeBody params,
  ) async {
    try {
      final remote = await _client.post<Map<String, dynamic>>(
        ApiPath.getListValidation,
        data: params,
      );

      return ListValidationModel.fromJson(remote.data!);
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
  Future<DetailValidationEntity> getDetailValidation(String id) async {
    try {
      final remote = await _client.get<Map<String, dynamic>>(
        '${ApiPath.validation}/$id',
      );

      return DetailValidationModel.fromJson(remote.data!);
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
  Future<DefaultEntity> rejectValidation(RejectValidationBody body) async {
    try {
      final remote = await _client.post<Map<String, dynamic>>(
        ApiPath.rejectValidation,
        data: body,
      );

      return DefaultModel.fromJson(remote.data!);
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
  Future<DefaultEntity> acceptValidation(String id) async {
    try {
      final remote = await _client.post<Map<String, dynamic>>(
        '${ApiPath.acceptValidation}/$id',
      );

      return DefaultModel.fromJson(remote.data!);
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
