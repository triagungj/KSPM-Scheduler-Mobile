import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/repositories/schedule_repository.dart';

class GetListDetailScheduleUsecase
    extends UseCase<ListDetailScheduleEntity, String> {
  GetListDetailScheduleUsecase(this._repository);
  final ScheduleRepository _repository;

  @override
  Future<Either<Failure, ListDetailScheduleEntity>> call(String params) {
    return _repository.getListDetailSchedule(params);
  }
}
