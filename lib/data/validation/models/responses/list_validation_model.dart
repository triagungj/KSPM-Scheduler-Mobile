import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';

part 'list_validation_model.g.dart';

@JsonSerializable(createToJson: false)
class ListValidationModel extends ListValidationEntity {
  const ListValidationModel({
    required int status,
    required ListValidationDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory ListValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ListValidationModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ListValidationDataModel extends ListValidationDataEntity {
  const ListValidationDataModel({
    required ValidationType validationType,
    required int total,
    required List<ValidationDataModel> listRequest,
  }) : super(
          validationType: validationType,
          total: total,
          listRequest: listRequest,
        );

  factory ListValidationDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListValidationDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ValidationDataModel extends ValidationDataEntity {
  const ValidationDataModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory ValidationDataModel.fromJson(Map<String, dynamic> json) =>
      _$ValidationDataModelFromJson(json);
}
