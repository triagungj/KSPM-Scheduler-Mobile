import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/auth/repositories/auth_repository.dart';

class ChangePasswordUsecase extends UseCase<DefaultEntity, ChangePasswordBody> {
  ChangePasswordUsecase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(ChangePasswordBody params) async {
    return _repository.changePassword(params);
  }
}
