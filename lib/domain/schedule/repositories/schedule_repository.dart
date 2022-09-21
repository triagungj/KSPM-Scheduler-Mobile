import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_my_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, ListMyScheduleEntity>> getListMySchedule(
    NoParams noParams,
  );
  Future<Either<Failure, ListScheduleEntity>> getListSchedule(
    NoParams noParams,
  );
  Future<Either<Failure, ListDetailScheduleEntity>> getListDetailSchedule(
    String id,
  );
  Future<Either<Failure, DetailScheduleSessionEntity>> getDetailScheduleSession(
    DetailScheduleSessionBody body,
  );
  Future<Either<Failure, DefaultEntity>> generateSchedule(
    NoParams noParams,
  );
}
