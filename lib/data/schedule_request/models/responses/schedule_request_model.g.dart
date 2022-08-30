// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleRequestModel _$ScheduleRequestModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleRequestModel(
      status: json['status'] as int,
      data: ScheduleRequestDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

ScheduleRequestDataModel _$ScheduleRequestDataModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleRequestDataModel(
      id: json['id'] as String,
      status: $enumDecodeNullable(_$ScheduleStatusTypeEnumMap, json['status']),
      nomorPetugas: json['nomor_petugas'] as String?,
      partisipanNotes: json['partisipan_notes'] as String?,
      petugasNotes: json['petugas_notes'] as String?,
      sessionListId: (json['session_list_id'] as List<dynamic>)
          .map((dynamic e) => e as int)
          .toList(),
      bukti: json['bukti'] as String?,
    );

const _$ScheduleStatusTypeEnumMap = {
  ScheduleStatusType.requested: 'requested',
  ScheduleStatusType.accepted: 'accepted',
  ScheduleStatusType.rejected: 'rejected',
};
