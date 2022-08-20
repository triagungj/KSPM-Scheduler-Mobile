import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';
import 'package:kspm_scheduler_mobile/domain/profile/repositories/profile_repository.dart';

class GetProfileUsecase extends UseCase<ProfileEntity, NoParams> {
  GetProfileUsecase(this._repository);
  final ProfileRepository _repository;

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return _repository.getProfile(NoParams());
  }
}
