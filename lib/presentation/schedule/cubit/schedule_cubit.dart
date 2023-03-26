import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule/models/requests/detail_schedule_session_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_detail_schedule_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_my_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/list_schedule_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/usecases/get_detail_schedule_session_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/usecases/get_list_detail_schedule_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/usecases/get_list_my_schedule_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/usecases/get_list_schedule_usecase.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit(
    this.getListMyScheduleUsecase,
    this.getListScheduleUsecase,
    this.getListDetailScheduleUsecase,
    this.getDetailScheduleSessionUsecase,
  ) : super(InitialScheduleState());

  Future<void> getListMySchedule() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListMyScheduleUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessLoadListMyScheduleState(r.data)),
    );
  }

  Future<void> getListSchedule() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListScheduleUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessLoadListScheduleState(r.data)),
    );
  }

  Future<void> getListDetailSchedule(String id) async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListDetailScheduleUsecase.call(id);

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessLoadListDetailScheduleState(r.data)),
    );
  }

  Future<void> getDetailScheduleSession(
    DetailScheduleSessionBody body,
  ) async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getDetailScheduleSessionUsecase.call(body);

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessLoadDetailScheduleSessionState(r.data)),
    );
  }

  final GetListMyScheduleUsecase getListMyScheduleUsecase;
  final GetListScheduleUsecase getListScheduleUsecase;
  final GetListDetailScheduleUsecase getListDetailScheduleUsecase;
  final GetDetailScheduleSessionUsecase getDetailScheduleSessionUsecase;
}
