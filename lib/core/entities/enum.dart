import 'package:json_annotation/json_annotation.dart';

enum ScheduleStatusType {
  @JsonValue('requested')
  requested,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
}

enum ValidationScheduleType {
  @JsonValue('not_validated')
  notValidated,
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

enum PrivilegeType {
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
