// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailValidationModel _$DetailValidationModelFromJson(
        Map<String, dynamic> json) =>
    DetailValidationModel(
      status: json['status'] as int,
      data: DetailValidationDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

DetailValidationDataModel _$DetailValidationDataModelFromJson(
        Map<String, dynamic> json) =>
    DetailValidationDataModel(
      id: json['id'] as String,
      partisipan: PartisipanValidationModel.fromJson(
          json['partisipan'] as Map<String, dynamic>),
      petugasName: json['petugas_name'] as String?,
      status: $enumDecodeNullable(_$ScheduleStatusTypeEnumMap, json['status']),
      validateAt: json['validate_at'] as String?,
      partisipanNotes: json['partisipan_notes'] as String?,
      petugasNotes: json['petugas_notes'] as String?,
      bukti: json['bukti'] as String?,
      listSessionId: (json['list_session_id'] as List<dynamic>)
          .map((dynamic e) => e as int)
          .toList(),
    );

const _$ScheduleStatusTypeEnumMap = {
  ScheduleStatusType.requested: 'requested',
  ScheduleStatusType.accepted: 'accepted',
  ScheduleStatusType.rejected: 'rejected',
};

PartisipanValidationModel _$PartisipanValidationModelFromJson(
        Map<String, dynamic> json) =>
    PartisipanValidationModel(
      name: json['name'] as String,
      jabatan: json['jabatan'] as String,
      memberId: json['member_id'] as String,
      phone: json['phone'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );
