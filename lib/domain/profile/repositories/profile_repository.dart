import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile(NoParams noParams);
}
