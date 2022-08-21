// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((dynamic e) =>
              SessionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SessionDataModel _$SessionDataModelFromJson(Map<String, dynamic> json) =>
    SessionDataModel(
      hari: $enumDecode(_$DayEnumEnumMap, json['hari']),
      result: (json['result'] as List<dynamic>)
          .map((dynamic e) =>
              SessionDataResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$DayEnumEnumMap = {
  DayEnum.senin: 'senin',
  DayEnum.selasa: 'selasa',
  DayEnum.rabu: 'rabu',
  DayEnum.kamis: 'kamis',
  DayEnum.jumat: 'jumat',
};

SessionDataResultModel _$SessionDataResultModelFromJson(
        Map<String, dynamic> json) =>
    SessionDataResultModel(
      id: json['id'] as int,
      pertemuanId: json['pertemuan_id'] as int,
      name: json['name'] as String,
      waktu: json['waktu'] as String,
    );
