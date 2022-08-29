import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';

class GetListMySessionUsecase
    extends UseCase<ScheduleRequestEntitiy, NoParams> {
  GetListMySessionUsecase(this._repository);
  final ScheduleRequestRepository _repository;

  @override
  Future<Either<Failure, ScheduleRequestEntitiy>> call(NoParams params) {
    return _repository.getListMySession(params);
  }
}
