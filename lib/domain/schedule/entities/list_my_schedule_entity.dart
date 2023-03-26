import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ListMyScheduleEntity extends Equatable {
  const ListMyScheduleEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final ListMyScheduleDataEntity data;

  @override
  List<Object> get props => [status, data];
}

class ListMyScheduleDataEntity extends Equatable {
  const ListMyScheduleDataEntity({
    required this.name,
    this.scheduleStatus,
    required this.schedules,
  });

  final String name;
  final ScheduleStatusType? scheduleStatus;
  final List<ScheduleEntity> schedules;

  @override
  List<Object?> get props => [name, scheduleStatus, schedules];
}

class ScheduleEntity extends Equatable {
  const ScheduleEntity({
    required this.pertemuan,
    required this.name,
    required this.hari,
    required this.waktu,
  });

  final String pertemuan;
  final String name;
  final DayEnum hari;
  final String waktu;

  @override
  List<Object> get props => [
        pertemuan,
        name,
        hari,
        waktu,
      ];
}
