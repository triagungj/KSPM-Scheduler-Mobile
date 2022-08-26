import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class SessionEntity extends Equatable {
  const SessionEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final List<SessionDataEntity> data;

  @override
  List<Object> get props => [status, data];
}

class SessionDataEntity extends Equatable {
  const SessionDataEntity({
    required this.hari,
    required this.result,
  });

  final DayEnum hari;
  final List<SessionDataResultEntity> result;

  @override
  List<Object> get props => [hari, result];
}

class SessionDataResultEntity extends Equatable {
  const SessionDataResultEntity({
    required this.id,
    required this.pertemuanId,
    required this.name,
    required this.waktu,
  });

  final int id;
  final String pertemuanId;
  final String name;
  final String waktu;

  @override
  List<Object> get props => [
        id,
        pertemuanId,
        name,
        waktu,
      ];
}
