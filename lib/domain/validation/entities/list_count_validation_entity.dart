import 'package:equatable/equatable.dart';

class ListCountValidationEntity extends Equatable {
  const ListCountValidationEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final ListCountValidationDataEntity data;

  @override
  List<Object> get props => [status, data];
}

class ListCountValidationDataEntity extends Equatable {
  const ListCountValidationDataEntity({
    required this.pengurus,
    required this.anggota,
  });

  final ResultCountValidationEntity pengurus;
  final ResultCountValidationEntity anggota;

  @override
  List<Object> get props => [pengurus, anggota];
}

class ResultCountValidationEntity extends Equatable {
  const ResultCountValidationEntity({
    required this.requested,
    required this.rejected,
    required this.accepted,
    required this.empty,
    required this.validated,
    required this.total,
  });

  final int requested;
  final int rejected;
  final int accepted;
  final int empty;
  final int validated;
  final int total;

  @override
  List<Object> get props => [
        requested,
        rejected,
        accepted,
        empty,
        validated,
        total,
      ];
}
