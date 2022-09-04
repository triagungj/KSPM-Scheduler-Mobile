import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';

part 'list_count_model.g.dart';

@JsonSerializable(createToJson: false)
class ListCountValidationModel extends ListCountValidationEntity {
  const ListCountValidationModel({
    required int status,
    required ListCountValidationDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory ListCountValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ListCountValidationModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ListCountValidationDataModel extends ListCountValidationDataEntity {
  const ListCountValidationDataModel({
    required ResultCountValidationModel pengurus,
    required ResultCountValidationModel anggota,
  }) : super(
          pengurus: pengurus,
          anggota: anggota,
        );

  factory ListCountValidationDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListCountValidationDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ResultCountValidationModel extends ResultCountValidationEntity {
  const ResultCountValidationModel({
    required int requested,
    required int rejected,
    required int accepted,
    required int empty,
    required int validated,
    required int total,
  }) : super(
          requested: requested,
          rejected: rejected,
          accepted: accepted,
          empty: empty,
          validated: validated,
          total: total,
        );

  factory ResultCountValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ResultCountValidationModelFromJson(json);
}
