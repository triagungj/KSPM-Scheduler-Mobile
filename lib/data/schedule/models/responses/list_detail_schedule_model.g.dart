// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDetailScheduleModel _$ListDetailScheduleModelFromJson(
        Map<String, dynamic> json) =>
    ListDetailScheduleModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((dynamic e) =>
              DetailScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DetailScheduleModel _$DetailScheduleModelFromJson(Map<String, dynamic> json) =>
    DetailScheduleModel(
      hari: $enumDecode(_$DayEnumEnumMap, json['hari']),
      listSession: (json['list_session'] as List<dynamic>)
          .map((dynamic e) =>
              DetailScheduleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$DayEnumEnumMap = {
  DayEnum.senin: 'senin',
  DayEnum.selasa: 'selasa',
  DayEnum.rabu: 'rabu',
  DayEnum.kamis: 'kamis',
  DayEnum.jumat: 'jumat',
};

DetailScheduleDataModel _$DetailScheduleDataModelFromJson(
        Map<String, dynamic> json) =>
    DetailScheduleDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      hari: $enumDecode(_$DayEnumEnumMap, json['hari']),
      waktu: json['waktu'] as String,
    );
