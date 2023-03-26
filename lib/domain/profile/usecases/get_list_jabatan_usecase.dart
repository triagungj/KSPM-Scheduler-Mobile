import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/profile/repositories/profile_repository.dart';

class GetListJabatanUsecase extends UseCase<JabatanEntity, NoParams> {
  GetListJabatanUsecase(this._repository);
  final ProfileRepository _repository;

  @override
  Future<Either<Failure, JabatanEntity>> call(NoParams params) {
    return _repository.getListJabatan(params);
  }
}
