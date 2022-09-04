import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ValidationTypeEntity extends Equatable {
  const ValidationTypeEntity({
    required this.partisipanType,
    required this.validationType,
  });

  final PartisipanType partisipanType;
  final ValidationType validationType;

  @override
  List<Object> get props => [
        partisipanType,
        validationType,
      ];
}
