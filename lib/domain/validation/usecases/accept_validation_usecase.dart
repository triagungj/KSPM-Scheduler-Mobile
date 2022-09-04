import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

class AcceptValidationUsecase extends UseCase<DefaultEntity, String> {
  AcceptValidationUsecase(this._repository);
  final ValidationRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(String params) {
    return _repository.acceptValidation(params);
  }
}
