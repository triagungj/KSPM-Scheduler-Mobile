import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';

part 'list_detail_schedule_model.g.dart';

@JsonSerializable(createToJson: false)
class ListDetailScheduleModel extends ListDetailScheduleEntity {
  const ListDetailScheduleModel({
    required int status,
    required List<DetailScheduleModel> data,
  }) : super(
          status: status,
          data: data,
        );

  factory ListDetailScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ListDetailScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DetailScheduleModel extends DetailScheduleEntity {
  const DetailScheduleModel({
    required DayEnum hari,
    required List<DetailScheduleDataModel> listSession,
  }) : super(
          hari: hari,
          listSession: listSession,
        );

  factory DetailScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$DetailScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DetailScheduleDataModel extends DetailScheduleDataEntity {
  const DetailScheduleDataModel({
    required int id,
    required String name,
    required DayEnum hari,
    required String waktu,
  }) : super(
          id: id,
          name: name,
          hari: hari,
          waktu: waktu,
        );

  factory DetailScheduleDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailScheduleDataModelFromJson(json);
}
