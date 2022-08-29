import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/requests/save_schedule_request_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';

class SendScheduleRequestUsecase
    extends UseCase<DefaultEntity, SaveScheduleRequestBody> {
  SendScheduleRequestUsecase(this._repository);
  final ScheduleRequestRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(
      SaveScheduleRequestBody params) async {
    return _repository.sendRequestSchedule(params);
  }
}
