import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/repositories/info_repository.dart';

class GetInfoListUsecase extends UseCase<InfoEntity, int> {
  GetInfoListUsecase(this._repository);
  final InfoRepository _repository;

  @override
  Future<Either<Failure, InfoEntity>> call(int params) {
    return _repository.getInfoList(params);
  }
}
