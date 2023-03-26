import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/data/info/models/responses/info_detail_model.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';

part 'info_model.g.dart';

@JsonSerializable(createToJson: false)
class InfoModel extends InfoEntity {
  const InfoModel({
    required int status,
    required InfoDataModel data,
  }) : super(
          data: data,
          status: status,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class InfoDataModel extends InfoDataEntity {
  const InfoDataModel({
    required List<InfoDetailDataModel> data,
    required int lastPage,
    required int total,
  }) : super(
          data: data,
          lastPage: lastPage,
          total: total,
        );

  factory InfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$InfoDataModelFromJson(json);
}
