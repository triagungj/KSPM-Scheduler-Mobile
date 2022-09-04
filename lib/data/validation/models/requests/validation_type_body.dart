import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

part 'validation_type_body.g.dart';

@JsonSerializable(createFactory: false)
class ValidationTypeBody {
  const ValidationTypeBody({
    required this.partisipanType,
    required this.validationType,
  });

  final PartisipanType partisipanType;
  final ValidationType validationType;

  Map<String, dynamic> toJson() => _$ValidationTypeBodyToJson(this);
}
