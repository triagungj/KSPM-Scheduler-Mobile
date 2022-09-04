import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ListValidationEntity extends Equatable {
  const ListValidationEntity({required this.status, required this.data});

  final int status;
  final ListValidationDataEntity data;

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class ListValidationDataEntity extends Equatable {
  const ListValidationDataEntity({
    required this.validationType,
    required this.total,
    required this.listRequest,
  });

  final ValidationType validationType;
  final int total;
  final List<ValidationDataEntity> listRequest;

  @override
  List<Object> get props => [
        validationType,
        total,
        listRequest,
      ];
}

class ValidationDataEntity extends Equatable {
  const ValidationDataEntity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
