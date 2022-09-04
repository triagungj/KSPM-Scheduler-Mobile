import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class DetailValidationEntity extends Equatable {
  const DetailValidationEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final DetailValidationDataEntity data;

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class DetailValidationDataEntity extends Equatable {
  const DetailValidationDataEntity({
    required this.id,
    required this.partisipan,
    this.petugasName,
    this.status,
    this.validateAt,
    this.partisipanNotes,
    this.petugasNotes,
    this.bukti,
    required this.listSessionId,
  });

  final String id;
  final PartisipanValidationEntity partisipan;
  final String? petugasName;
  final ScheduleStatusType? status;
  final String? validateAt;
  final String? partisipanNotes;
  final String? petugasNotes;
  final String? bukti;
  final List<int> listSessionId;

  @override
  List<Object?> get props => [
        id,
        partisipan,
        petugasName,
        status,
        validateAt,
        partisipanNotes,
        petugasNotes,
        bukti,
        listSessionId,
      ];
}

class PartisipanValidationEntity extends Equatable {
  const PartisipanValidationEntity({
    required this.name,
    required this.jabatan,
    required this.memberId,
    required this.phone,
    required this.avatarUrl,
  });

  final String name;
  final String jabatan;
  final String memberId;
  final String phone;
  final String? avatarUrl;

  @override
  List<Object?> get props => [
        name,
        jabatan,
        memberId,
        phone,
        avatarUrl,
      ];
}
