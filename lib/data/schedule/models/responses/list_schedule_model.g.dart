// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListScheduleModel _$ListScheduleModelFromJson(Map<String, dynamic> json) =>
    ListScheduleModel(
      status: json['status'] as int,
      data:
          ListScheduleDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

ListScheduleDataModel _$ListScheduleDataModelFromJson(
        Map<String, dynamic> json) =>
    ListScheduleDataModel(
      lastUpdate: json['last_update'] as String?,
      published: json['published'] as bool,
      listSchedule: (json['list_schedule'] as List<dynamic>?)
          ?.map(
              (dynamic e) => ListMeetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ListMeetModel _$ListMeetModelFromJson(Map<String, dynamic> json) =>
    ListMeetModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
