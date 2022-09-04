import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

class RejectValidationUsecase
    extends UseCase<DefaultEntity, RejectValidationBody> {
  RejectValidationUsecase(this._repository);
  final ValidationRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(RejectValidationBody params) {
    return _repository.rejectValidation(params);
  }
}
