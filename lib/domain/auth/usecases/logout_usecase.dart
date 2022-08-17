import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/repositories/auth_repository.dart';

class LogoutUsecase extends UseCase<DefaultEntity, NoParams> {
  LogoutUsecase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(NoParams params) {
    return _repository.requestLogout(params);
  }
}
