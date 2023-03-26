import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/repositories/info_repository.dart';

class GetInfoDetailUsecase extends UseCase<InfoDetailEntity, String> {
  GetInfoDetailUsecase(this._repository);
  final InfoRepository _repository;

  @override
  Future<Either<Failure, InfoDetailEntity>> call(String params) {
    return _repository.getInfo(params);
  }
}
