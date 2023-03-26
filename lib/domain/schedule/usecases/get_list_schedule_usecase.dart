import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

class GetListScheduleUsecase extends UseCase<ListScheduleEntity, NoParams> {
  GetListScheduleUsecase(this._repository);
  final ScheduleRepository _repository;

  @override
  Future<Either<Failure, ListScheduleEntity>> call(NoParams params) {
    return _repository.getListSchedule(params);
  }
}
