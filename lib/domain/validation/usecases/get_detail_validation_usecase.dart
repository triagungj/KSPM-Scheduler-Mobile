import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/repositories/validation_repository.dart';

class GetDetailValidationUsecase
    extends UseCase<DetailValidationEntity, String> {
  GetDetailValidationUsecase(this._repository);
  final ValidationRepository _repository;

  @override
  Future<Either<Failure, DetailValidationEntity>> call(String params) async {
    return _repository.getDetailValidation(params);
  }
}
