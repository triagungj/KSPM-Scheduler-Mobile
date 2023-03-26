import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';

part 'detail_validation_model.g.dart';

@JsonSerializable(createToJson: false)
class DetailValidationModel extends DetailValidationEntity {
  const DetailValidationModel({
    required int status,
    required DetailValidationDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory DetailValidationModel.fromJson(Map<String, dynamic> json) =>
      _$DetailValidationModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DetailValidationDataModel extends DetailValidationDataEntity {
  const DetailValidationDataModel({
    required String id,
    required PartisipanValidationModel partisipan,
    String? petugasName,
    ScheduleStatusType? status,
    String? validateAt,
    String? partisipanNotes,
    String? petugasNotes,
    String? bukti,
    required List<int> listSessionId,
  }) : super(
          id: id,
          partisipan: partisipan,
          petugasName: petugasName,
          status: status,
          validateAt: validateAt,
          partisipanNotes: partisipanNotes,
          bukti: bukti,
          listSessionId: listSessionId,
          petugasNotes: petugasNotes,
        );

  factory DetailValidationDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailValidationDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PartisipanValidationModel extends PartisipanValidationEntity {
  const PartisipanValidationModel({
    required String name,
    required String jabatan,
    required String memberId,
    required String phone,
    String? avatarUrl,
  }) : super(
          name: name,
          jabatan: jabatan,
          memberId: memberId,
          phone: phone,
          avatarUrl: avatarUrl,
        );

  factory PartisipanValidationModel.fromJson(Map<String, dynamic> json) =>
      _$PartisipanValidationModelFromJson(json);
}
