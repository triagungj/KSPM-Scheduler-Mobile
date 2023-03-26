import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';

part 'info_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class InfoDetailModel extends InfoDetailEntity {
  const InfoDetailModel({
    required int status,
    required InfoDetailDataModel data,
  }) : super(
          data: data,
          status: status,
        );
  factory InfoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InfoDetailModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class InfoDetailDataModel extends InfoDetailDataEntity {
  const InfoDetailDataModel({
    required super.id,
    required super.title,
    required super.description,
    required super.createdAt,
  });

  factory InfoDetailDataModel.fromJson(Map<String, dynamic> json) =>
      _$InfoDetailDataModelFromJson(json);
}
