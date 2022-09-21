// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_schedule_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailScheduleSessionModel _$DetailScheduleSessionModelFromJson(
        Map<String, dynamic> json) =>
    DetailScheduleSessionModel(
      status: json['status'] as int,
      data: DetailScheduleSessionDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

DetailScheduleSessionDataModel _$DetailScheduleSessionDataModelFromJson(
        Map<String, dynamic> json) =>
    DetailScheduleSessionDataModel(
      details:
          SessionDetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      listPartisipan: (json['list_partisipan'] as List<dynamic>)
          .map((dynamic e) =>
              SessionPartisipanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prev: json['prev'] as bool,
      next: json['next'] as bool,
    );

SessionDetailsModel _$SessionDetailsModelFromJson(Map<String, dynamic> json) =>
    SessionDetailsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      hari: $enumDecode(_$DayEnumEnumMap, json['hari']),
      waktu: json['waktu'] as String,
      pertemuan: json['pertemuan'] as String,
    );

const _$DayEnumEnumMap = {
  DayEnum.senin: 'senin',
  DayEnum.selasa: 'selasa',
  DayEnum.rabu: 'rabu',
  DayEnum.kamis: 'kamis',
  DayEnum.jumat: 'jumat',
};

SessionPartisipanModel _$SessionPartisipanModelFromJson(
        Map<String, dynamic> json) =>
    SessionPartisipanModel(
      id: json['id'] as String,
      name: json['name'] as String,
      jabatan: json['jabatan'] as String,
      memberId: json['member_id'] as String,
      avatarUrl: json['avatar_url'] as String?,
      phoneNumber: json['phone_number'] as String,
    );
