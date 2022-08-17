import 'package:kspm_scheduler_mobile/core/entities/enum.dart';

class ValidationEntity {
  ValidationEntity({
    required this.privilegeType,
    required this.validationScheduleType,
  });

  final PrivilegeType privilegeType;
  final ValidationScheduleType validationScheduleType;
}
