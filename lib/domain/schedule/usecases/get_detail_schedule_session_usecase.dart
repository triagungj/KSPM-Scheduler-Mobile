import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

class GetDetailScheduleSessionUsecase
    extends UseCase<DetailScheduleSessionEntity, DetailScheduleSessionBody> {
  GetDetailScheduleSessionUsecase(this._repository);
  final ScheduleRepository _repository;

  @override
  Future<Either<Failure, DetailScheduleSessionEntity>> call(
    DetailScheduleSessionBody params,
  ) {
    return _repository.getDetailScheduleSession(
      params,
    );
  }
}
