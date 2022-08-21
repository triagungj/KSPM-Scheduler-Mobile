import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';

abstract class ScheduleRemoteDatasource {
  Future<SessionEntity> getListSession(NoParams noParams);
}

class ScheduleRemoteDatasourceImpl implements ScheduleRemoteDatasource {
  ScheduleRemoteDatasourceImpl(this.client);

  final Dio client;

  @override
  Future<SessionEntity> getListSession(NoParams noParams) async {
    try {
      final remoteGetListSession = await client.get<Map<String, dynamic>>(
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
}
