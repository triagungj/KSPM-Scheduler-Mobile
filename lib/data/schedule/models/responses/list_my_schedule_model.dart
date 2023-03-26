import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_my_schedule_entity.dart';

part 'list_my_schedule_model.g.dart';

@JsonSerializable(createToJson: false)
class ListMyScheduleModel extends ListMyScheduleEntity {
  const ListMyScheduleModel({
    required int status,
    required ListMyScheduleDataModel data,
  }) : super(
          status: status,
          data: data,
        );
  factory ListMyScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ListMyScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ListMyScheduleDataModel extends ListMyScheduleDataEntity {
  const ListMyScheduleDataModel({
    required String name,
    ScheduleStatusType? scheduleStatus,
    required List<ScheduleModel> schedules,
  }) : super(
          name: name,
          scheduleStatus: scheduleStatus,
          schedules: schedules,
        );

  factory ListMyScheduleDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListMyScheduleDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required super.pertemuan,
    required super.name,
    required super.hari,
    required super.waktu,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
