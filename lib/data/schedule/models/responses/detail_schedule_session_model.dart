import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';

part 'detail_schedule_session_model.g.dart';

@JsonSerializable(createToJson: false)
class DetailScheduleSessionModel extends DetailScheduleSessionEntity {
  const DetailScheduleSessionModel({
    required int status,
    required DetailScheduleSessionDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory DetailScheduleSessionModel.fromJson(Map<String, dynamic> json) =>
      _$DetailScheduleSessionModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DetailScheduleSessionDataModel extends DetailScheduleSessionDataEntity {
  const DetailScheduleSessionDataModel({
    required SessionDetailsModel details,
    required List<SessionPartisipanModel> listPartisipan,
    required bool prev,
    required bool next,
  }) : super(
          details: details,
          listPartisipan: listPartisipan,
          prev: prev,
          next: next,
        );

  factory DetailScheduleSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailScheduleSessionDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionDetailsModel extends SessionDetailsEntity {
  const SessionDetailsModel({
    required int id,
    required String name,
    required DayEnum hari,
    required String waktu,
    required String pertemuan,
  }) : super(
          id: id,
          name: name,
          hari: hari,
          waktu: waktu,
          pertemuan: pertemuan,
        );

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionPartisipanModel extends SessionPartisipanEntity {
  const SessionPartisipanModel({
    required String id,
    required String name,
    required String jabatan,
    required String memberId,
    String? avatarUrl,
    required String phoneNumber,
  }) : super(
          id: id,
          name: name,
          jabatan: jabatan,
          avatarUrl: avatarUrl,
          memberId: memberId,
          phoneNumber: phoneNumber,
        );

  factory SessionPartisipanModel.fromJson(Map<String, dynamic> json) =>
      _$SessionPartisipanModelFromJson(json);
}
