import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/auth/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
  Future<Either<Failure, DefaultEntity>> requestLogout(NoParams noParams);
  Future<Either<Failure, DefaultEntity>> changePassword(
    ChangePasswordBody body,
  );
}
