import 'package:dio/dio.dart';
import 'package:kspm_scheduler_mobile/core/constants/api_path.dart';
import 'package:kspm_scheduler_mobile/core/error/exceptions.dart';
import 'package:kspm_scheduler_mobile/data/info/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';

abstract class InfoRemoteDataSource {
  Future<InfoEntity> getInfoList(int page);
  Future<InfoDetailEntity> getInfo(String id);
}

class InfoRemoteDataSourceImpl extends InfoRemoteDataSource {
  InfoRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<InfoEntity> getInfoList(int page) async {
    try {
      final infoRemote = await _client.get<Map<String, dynamic>>(
        ApiPath.info,
        queryParameters: <String, dynamic>{
          'page': page,
        },
      );

      return InfoModel.fromJson(infoRemote.data!);
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
  Future<InfoDetailEntity> getInfo(String id) async {
    try {
      final infoRemote = await _client.get<Map<String, dynamic>>(
        '${ApiPath.info}/$id',
      );

      return InfoDetailModel.fromJson(infoRemote.data!);
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
