import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

class GetListCountValidationUsecase
    extends UseCase<ListCountValidationEntity, NoParams> {
  GetListCountValidationUsecase(this._repository);
  final ValidationRepository _repository;

  @override
  Future<Either<Failure, ListCountValidationEntity>> call(
    NoParams params,
  ) async {
    return _repository.getListCountValidation(params);
  }
}
