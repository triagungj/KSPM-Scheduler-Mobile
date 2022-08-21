import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, SessionEntity>> getListSession(NoParams noParams);
}
