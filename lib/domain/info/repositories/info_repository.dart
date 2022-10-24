

import 'package:dartz/dartz.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';

abstract class InfoRepository{
  Future<Either<Failure, InfoEntity>> getInfoList(int page);
  Future<Either<Failure, InfoDetailEntity>> getInfo(String id);
}