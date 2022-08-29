import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';

part 'schedule_request_model.g.dart';

@JsonSerializable(createToJson: false)
class ScheduleRequestModel extends ScheduleRequestEntitiy {
  const ScheduleRequestModel({
    required int status,
    required ScheduleRequestDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory ScheduleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ScheduleRequestDataModel extends ScheduleRequestDataEntity {
  const ScheduleRequestDataModel({
    required String id,
    ScheduleStatusType? status,
    String? nomorPetugas,
    String? partisipantNotes,
    String? petugasNotes,
    required List<int> sessionListId,
    String? bukti,
  }) : super(
          id: id,
          nomorPetugas: nomorPetugas,
          sessionListId: sessionListId,
          bukti: bukti,
          partisipantNotes: partisipantNotes,
          petugasNotes: petugasNotes,
          status: status,
        );

  factory ScheduleRequestDataModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestDataModelFromJson(json);
}
