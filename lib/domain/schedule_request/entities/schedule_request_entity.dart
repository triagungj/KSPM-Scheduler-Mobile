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
    this.partisipantNotes,
    this.petugasNotes, 
    required this.sessionListId,
  });

  final String id;
  final ScheduleStatusType? status;
  final String? nomorPetugas;
  final String? bukti;
  final String? partisipantNotes;
  final String? petugasNotes;
  final List<int> sessionListId;

  @override
  List<Object?> get props => [
        id,
        status,
        nomorPetugas,
        bukti,
        partisipantNotes,
        petugasNotes,
        sessionListId,
      ];
}

//  "id": "fca72e72-6efb-469c-b65f-e9da57ba64ea",
//         "status": "requested",
//         "petugas": null,
//         "bukti": "http://192.168.1.16:8000/file/aHBv1AG0jqeSyYKJ9JYAJ9x58pGHPzcWO6XwKWQK.png",
//         "partisipant_notes": "Yuhu",
//         "session_list": [
//             7,
//             2,
//             5
//         ]

