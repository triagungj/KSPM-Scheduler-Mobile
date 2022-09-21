import 'package:equatable/equatable.dart';

class ListScheduleEntity extends Equatable {
  const ListScheduleEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final ListScheduleDataEntity data;

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class ListScheduleDataEntity extends Equatable {
  const ListScheduleDataEntity({
    required this.lastUpdate,
    required this.published,
    required this.listSchedule,
  });

  final String? lastUpdate;
  final bool published;
  final List<ListMeetEntity>? listSchedule;

  @override
  List<Object?> get props => [];
}

class ListMeetEntity extends Equatable {
  const ListMeetEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
