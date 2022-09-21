import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

class GenerateScheduleUsecase extends UseCase<DefaultEntity, NoParams> {
  GenerateScheduleUsecase(this._repository);
  final ScheduleRepository _repository;

  @override
  Future<Either<Failure, DefaultEntity>> call(NoParams params) {
    return _repository.generateSchedule(params);
  }
}
