import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel extends SessionEntity {
  const SessionModel({
    required int status,
    required List<SessionDataModel> data,
  }) : super(
          status: status,
          data: data,
        );

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionDataModel extends SessionDataEntity {
  const SessionDataModel({
    required DayEnum hari,
    required List<SessionDataResultModel> result,
  }) : super(
          hari: hari,
          result: result,
        );

  factory SessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionDataResultModel extends SessionDataResultEntity {
  const SessionDataResultModel({
    required int id,
    required int pertemuanId,
    required String name,
    required String waktu,
  }) : super(
          id: id,
          pertemuanId: pertemuanId,
          name: name,
          waktu: waktu,
        );

  factory SessionDataResultModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDataResultModelFromJson(json);
}
