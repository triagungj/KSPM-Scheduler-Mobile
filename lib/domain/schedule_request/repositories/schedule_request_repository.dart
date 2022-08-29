import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';

abstract class ScheduleRequestRepository {
  Future<Either<Failure, DefaultEntity>> saveRequestSchedule(
    SaveScheduleRequestBody body,
  );
  Future<Either<Failure, DefaultEntity>> sendRequestSchedule(
    SaveScheduleRequestBody body,
  );
  Future<Either<Failure, DefaultEntity>> postponeRequestSchedule(
    NoParams noParams,
  );
  Future<Either<Failure, SessionEntity>> getListSession(NoParams noParams);
  Future<Either<Failure, ScheduleRequestEntitiy>> getListMySession(
    NoParams noParams,
  );
}
