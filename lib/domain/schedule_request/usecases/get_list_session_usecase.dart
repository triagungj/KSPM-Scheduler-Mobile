import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';

class GetListSessionUsecase extends UseCase<SessionEntity, NoParams> {
  GetListSessionUsecase(this._repository);
  final ScheduleRequestRepository _repository;

  @override
  Future<Either<Failure, SessionEntity>> call(NoParams params) {
    return _repository.getListSession(params);
  }
}
