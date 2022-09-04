import 'package:json_annotation/json_annotation.dart';

enum ScheduleStatusType {
  @JsonValue('requested')
  requested,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
}

enum ValidationType {
  @JsonValue('requested')
  requested,
  @JsonValue('rejected')
  rejected,
  @JsonValue('empty')
  empty,
  @JsonValue('validated')
  validated,
  @JsonValue('accepted')
  accepted,
  @JsonValue('all')
  all,
}

enum PartisipanType {
  @JsonValue('pengurus')
  pengurus,
  @JsonValue('anggota')
  anggota,
}

enum DayEnum {
  @JsonValue('senin')
  senin,
  @JsonValue('selasa')
  selasa,
  @JsonValue('rabu')
  rabu,
  @JsonValue('kamis')
  kamis,
  @JsonValue('jumat')
  jumat,
}
