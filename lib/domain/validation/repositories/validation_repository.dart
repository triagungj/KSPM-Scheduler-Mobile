import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';

abstract class ValidationRepository {
  Future<Either<Failure, ListCountValidationEntity>> getListCountValidation(
    NoParams noParams,
  );
  Future<Either<Failure, ListValidationEntity>> getListValidation(
    ValidationTypeBody body,
  );
  Future<Either<Failure, DetailValidationEntity>> getDetailValidation(
    String param,
  );
  Future<Either<Failure, DefaultEntity>> rejectValidation(
    RejectValidationBody body,
  );
  Future<Either<Failure, DefaultEntity>> acceptValidation(
    String param,
  );
}
