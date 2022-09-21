// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_my_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMyScheduleModel _$ListMyScheduleModelFromJson(Map<String, dynamic> json) =>
    ListMyScheduleModel(
      status: json['status'] as int,
      data: ListMyScheduleDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

ListMyScheduleDataModel _$ListMyScheduleDataModelFromJson(
        Map<String, dynamic> json) =>
    ListMyScheduleDataModel(
      name: json['name'] as String,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map(
              (dynamic e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      pertemuan: json['pertemuan'] as String,
      name: json['name'] as String,
      hari: $enumDecode(_$DayEnumEnumMap, json['hari']),
      waktu: json['waktu'] as String,
    );

const _$DayEnumEnumMap = {
  DayEnum.senin: 'senin',
  DayEnum.selasa: 'selasa',
  DayEnum.rabu: 'rabu',
  DayEnum.kamis: 'kamis',
  DayEnum.jumat: 'jumat',
};
