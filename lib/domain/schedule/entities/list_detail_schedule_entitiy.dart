import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ListDetailScheduleEntity extends Equatable {
  const ListDetailScheduleEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final List<DetailScheduleEntity> data;

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class DetailScheduleEntity extends Equatable {
  const DetailScheduleEntity({
    required this.hari,
    required this.listSession,
  });

  final DayEnum hari;
  final List<DetailScheduleDataEntity> listSession;

  @override
  List<Object> get props => [
        hari,
        listSession,
      ];
}

class DetailScheduleDataEntity extends Equatable {
  const DetailScheduleDataEntity({
    required this.id,
    required this.name,
    required this.hari,
    required this.waktu,
  });

  final int id;
  final String name;
  final DayEnum hari;
  final String waktu;

  @override
  List<Object> get props => [
        id,
        name,
        hari,
        waktu,
      ];
}
