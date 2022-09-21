import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class DetailScheduleSessionEntity extends Equatable {
  const DetailScheduleSessionEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final DetailScheduleSessionDataEntity data;

  @override
  List<Object> get props => [status, data];
}

class DetailScheduleSessionDataEntity extends Equatable {
  const DetailScheduleSessionDataEntity({
    required this.details,
    required this.listPartisipan,
    required this.next,
    required this.prev,
  });

  final SessionDetailsEntity details;
  final List<SessionPartisipanEntity> listPartisipan;
  final bool next;
  final bool prev;

  @override
  List<Object> get props => [details, listPartisipan];
}

class SessionDetailsEntity extends Equatable {
  const SessionDetailsEntity({
    required this.id,
    required this.name,
    required this.hari,
    required this.waktu,
    required this.pertemuan,
  });

  final int id;
  final String name;
  final DayEnum hari;
  final String waktu;
  final String pertemuan;

  @override
  List<Object> get props => [
        id,
        name,
        hari,
        waktu,
        pertemuan,
      ];
}

class SessionPartisipanEntity extends Equatable {
  const SessionPartisipanEntity({
    required this.id,
    required this.name,
    required this.memberId,
    required this.phoneNumber,
    this.avatarUrl,
    required this.jabatan,
  });

  final String id;
  final String name;
  final String memberId;
  final String phoneNumber;
  final String? avatarUrl;
  final String jabatan;

  @override
  List<Object?> get props => [
        id,
        name,
        memberId,
        phoneNumber,
        avatarUrl,
        jabatan,
      ];
}
