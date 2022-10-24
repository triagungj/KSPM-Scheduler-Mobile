import 'package:equatable/equatable.dart';

import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';

class InfoEntity extends Equatable {
  const InfoEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final InfoDataEntity data;

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class InfoDataEntity extends Equatable {
  const InfoDataEntity({
    required this.data,
    required this.lastPage,
    required this.total,
  });

  final List<InfoDetailDataEntity> data;
  final int lastPage;
  final int total;

  @override
  List<Object> get props => [
        data,
        lastPage,
        total,
      ];
}
