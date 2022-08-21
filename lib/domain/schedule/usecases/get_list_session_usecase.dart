import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

class GetListSessionUsecase extends UseCase<SessionEntity, NoParams> {
  GetListSessionUsecase(this._repository);
  final ScheduleRepository _repository;

  @override
  Future<Either<Failure, SessionEntity>> call(NoParams params) {
    return _repository.getListSession(params);
  }
}
