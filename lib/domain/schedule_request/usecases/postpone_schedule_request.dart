import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/repositories/schedule_request_repository.dart';

class PostponeScheduleRequestUsecase extends UseCase<DefaultEntity, NoParams> {
  PostponeScheduleRequestUsecase(this._repository);
  final ScheduleRequestRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(NoParams params) async {
    return _repository.postponeRequestSchedule(params);
  }
}
