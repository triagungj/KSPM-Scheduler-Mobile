import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

part 'detail_schedule_session_body.g.dart';

@JsonSerializable(createFactory: false)
class DetailScheduleSessionBody {
  const DetailScheduleSessionBody({
    required this.partisipanType,
    required this.sessionId,
  });

  final PartisipanType partisipanType;
  final int sessionId;

  Map<String, dynamic> toJson() => _$DetailScheduleSessionBodyToJson(this);
}
