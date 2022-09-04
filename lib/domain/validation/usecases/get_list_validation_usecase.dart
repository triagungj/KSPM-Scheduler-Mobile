import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

class GetListValidationUsecase
    extends UseCase<ListValidationEntity, ValidationTypeBody> {
  GetListValidationUsecase(this._repository);
  final ValidationRepository _repository;

  @override
  Future<Either<Failure, ListValidationEntity>> call(
    ValidationTypeBody params,
  ) async {
    return _repository.getListValidation(params);
  }
}
