import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/models.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/responses/schedule_request_model.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';

abstract class ScheduleRequestRemoteDataSource {
  Future<SessionEntity> getListSession(NoParams noParams);
  Future<ScheduleRequestEntitiy> getListMySession(NoParams noParams);
  Future<DefaultEntity> saveScheduleRequest(SaveScheduleRequestBody body);
  Future<DefaultEntity> sendScheduleRequest(SaveScheduleRequestBody body);
  Future<DefaultEntity> postponeScheduleRequest(NoParams noParams);
}

class ScheduleRequestRemoteDataSourceImpl
    implements ScheduleRequestRemoteDataSource {
  ScheduleRequestRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<SessionEntity> getListSession(NoParams noParams) async {
    try {
      final remoteGetListSession = await _client.get<Map<String, dynamic>>(
        ApiPath.session,
      );

      return SessionModel.fromJson(remoteGetListSession.data!);
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
  Future<DefaultEntity> saveScheduleRequest(
    SaveScheduleRequestBody body,
  ) async {
    final data = FormData.fromMap(<String, dynamic>{
      'file': body.file != null
          ? await MultipartFile.fromFile(
              body.file!,
              filename: 'file',
            )
          : null,
      'list_session_id[]': body.listSessionId,
      'partisipan_notes': body.partisipanNotes,
    });

    try {
      final response = await _client.post<Map<String, dynamic>>(
        ApiPath.saveRequestSchedule,
        data: data,
      );
      return DefaultModel.fromJson(response.data!);
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
  Future<DefaultEntity> sendScheduleRequest(
    SaveScheduleRequestBody body,
  ) async {
    final data = FormData.fromMap(<String, dynamic>{
      'file': body.file != null
          ? await MultipartFile.fromFile(
              body.file!,
              filename: 'file',
            )
          : null,
      'list_session_id[]': body.listSessionId,
      'partisipan_notes': body.partisipanNotes,
    });

    try {
      final response = await _client.post<Map<String, dynamic>>(
        ApiPath.sendRequestSchedule,
        data: data,
      );
      return DefaultModel.fromJson(response.data!);
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
  Future<ScheduleRequestEntitiy> getListMySession(NoParams noParams) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.getRequestSchedule,
      );
      return ScheduleRequestModel.fromJson(response.data!);
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
  Future<DefaultEntity> postponeScheduleRequest(
    NoParams noParams,
  ) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.postponeScheduleRequest,
      );
      return DefaultModel.fromJson(response.data!);
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
