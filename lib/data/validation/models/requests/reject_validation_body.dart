import 'package:json_annotation/json_annotation.dart';

part 'reject_validation_body.g.dart';

@JsonSerializable(createFactory: false)
class RejectValidationBody {
  RejectValidationBody({
    required this.id,
    required this.petugasNotes,
  });

  final String id;
  final String petugasNotes;

  Map<String, dynamic> toJson() => _$RejectValidationBodyToJson(this);
}
