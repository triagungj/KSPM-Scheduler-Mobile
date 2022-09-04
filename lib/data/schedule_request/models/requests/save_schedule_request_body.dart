import 'package:json_annotation/json_annotation.dart';

part 'save_schedule_request_body.g.dart';

@JsonSerializable(createFactory: false)
class SaveScheduleRequestBody {
  const SaveScheduleRequestBody({
    this.partisipanNotes,
    required this.listSessionId,
    this.file,
  });

  final String? partisipanNotes;
  final List<int> listSessionId;
  final String? file;

  Map<String, dynamic> toJson() => _$SaveScheduleRequestBodyToJson(this);
}
