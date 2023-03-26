import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';

part 'list_schedule_model.g.dart';

@JsonSerializable(createToJson: false)
class ListScheduleModel extends ListScheduleEntity {
  const ListScheduleModel({
    required int status,
    ListScheduleDataModel? data,
  }) : super(
          status: status,
          data: data,
        );

  factory ListScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ListScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ListScheduleDataModel extends ListScheduleDataEntity {
  const ListScheduleDataModel({
    String? lastUpdate,
    required bool published,
    List<ListMeetModel>? listSchedule,
  }) : super(
          lastUpdate: lastUpdate,
          published: published,
          listSchedule: listSchedule,
        );

  factory ListScheduleDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListScheduleDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ListMeetModel extends ListMeetEntity {
  const ListMeetModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory ListMeetModel.fromJson(Map<String, dynamic> json) =>
      _$ListMeetModelFromJson(json);
}
