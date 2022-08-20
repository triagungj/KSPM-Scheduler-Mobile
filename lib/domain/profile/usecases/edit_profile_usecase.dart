import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/domain/profile/repositories/profile_repository.dart';

class EditProfileUsecase extends UseCase<DefaultEntity, EditProfileBody> {
  EditProfileUsecase(this._repository);
  final ProfileRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(EditProfileBody params) {
    return _repository.editProfile(params);
  }
}
