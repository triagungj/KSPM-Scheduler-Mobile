import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ScheduleRequestEntitiy extends Equatable {
  const ScheduleRequestEntitiy({
    required this.status,
    required this.data,
  });

  final int status;
  final ScheduleRequestDataEntity data;

  @override
  List<Object> get props => [status, data];
}

class ScheduleRequestDataEntity extends Equatable {
  const ScheduleRequestDataEntity({
    required this.id,
    required this.nomorPetugas,
    this.status,
    this.bukti,
    this.partisipanNotes,
    this.petugasNotes,
    required this.sessionListId,
  });

  final String id;
  final ScheduleStatusType? status;
  final String? nomorPetugas;
  final String? bukti;
  final String? partisipanNotes;
  final String? petugasNotes;
  final List<int> sessionListId;

  @override
  List<Object?> get props => [
        id,
        status,
        nomorPetugas,
        bukti,
        partisipanNotes,
        petugasNotes,
        sessionListId,
      ];
}
