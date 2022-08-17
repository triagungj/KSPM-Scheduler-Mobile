import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';

part 'default_model.g.dart';

@JsonSerializable(createToJson: false)
class DefaultModel extends DefaultEntity {
  const DefaultModel({
    required int status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );

  factory DefaultModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultModelFromJson(json);
}
