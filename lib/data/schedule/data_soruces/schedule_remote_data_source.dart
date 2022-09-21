import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/models/default_model.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/responses/detail_schedule_session_model.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/responses/list_detail_schedule_model.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/responses/list_my_schedule_model.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/responses/list_schedule_model.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_my_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';

abstract class ScheduleRemoteDataSource {
  Future<ListMyScheduleEntity> getListMySchedule(NoParams noParams);
  Future<ListScheduleEntity> getListSchedule(NoParams noParams);
  Future<ListDetailScheduleEntity> getListDetailSchedule(String id);
  Future<DetailScheduleSessionEntity> getDetailScheduleSession(
    DetailScheduleSessionBody body,
  );
  Future<DefaultEntity> generateSchedule(NoParams noParams);
}

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  ScheduleRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<ListScheduleEntity> getListSchedule(
    NoParams noParams,
  ) async {
    try {
      final remoteDataSource = await _client.get<Map<String, dynamic>>(
        ApiPath.scheduleList,
      );

      return ListScheduleModel.fromJson(remoteDataSource.data!);
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
  Future<ListDetailScheduleEntity> getListDetailSchedule(String id) async {
    try {
      final remoteDataSource = await _client.get<Map<String, dynamic>>(
        '${ApiPath.scheduleListDetail}/$id',
      );

      return ListDetailScheduleModel.fromJson(remoteDataSource.data!);
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
  Future<DetailScheduleSessionEntity> getDetailScheduleSession(
    DetailScheduleSessionBody body,
  ) async {
    try {
      final remoteDataSource = await _client.post<Map<String, dynamic>>(
        ApiPath.scheduleDetail,
        data: body,
      );

      return DetailScheduleSessionModel.fromJson(remoteDataSource.data!);
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
  Future<ListMyScheduleEntity> getListMySchedule(NoParams noParams) async {
    try {
      final remoteDataSource = await _client.get<Map<String, dynamic>>(
        ApiPath.schedule,
      );

      return ListMyScheduleModel.fromJson(remoteDataSource.data!);
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
  Future<DefaultEntity> generateSchedule(NoParams noParams) async {
    try {
      final remoteDataSource = await _client.get<Map<String, dynamic>>(
        ApiPath.scheduleGenerate,
      );

      return DefaultModel.fromJson(remoteDataSource.data!);
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
