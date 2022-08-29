import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/get_list_my_session_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/get_list_session_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/postpone_schedule_request.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/save_schedule_request_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/usecases/send_schedule_request_usecase.dart';

part 'schedule_request_state.dart';

class ScheduleRequestCubit extends Cubit<ScheduleRequestState> {
  ScheduleRequestCubit(
    this.getListSessionUsecase,
    this.saveScheduleRequestUsecase,
    this.getListMySessionUsecase,
    this.sendScheduleRequestUsecase,
    this.postponeScheduleRequestUsecase,
  ) : super(InitialScheduleState());

  Future<void> getListSession() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListSessionUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessGetListSessionState(r.data)),
    );
  }

  Future<void> saveScheduleRequest(SaveScheduleRequestBody params) async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await saveScheduleRequestUsecase.call(params);

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessSaveScheduleRequestState(r.message)),
    );
  }

  Future<void> sendScheduleRequest(SaveScheduleRequestBody params) async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await sendScheduleRequestUsecase.call(params);

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessSendScheduleRequestState(r.message)),
    );
  }

  Future<void> getListMySession() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListMySessionUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessLoadListMySessionState(r.data)),
    );
  }

  Future<void> postponeScheduleRequest() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await postponeScheduleRequestUsecase.call(
      NoParams(),
    );

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessPostponeScheduleRequest(r.message)),
    );
  }

  final GetListSessionUsecase getListSessionUsecase;
  final SaveScheduleRequestUsecase saveScheduleRequestUsecase;
  final SendScheduleRequestUsecase sendScheduleRequestUsecase;
  final GetListMySessionUsecase getListMySessionUsecase;
  final PostponeScheduleRequestUsecase postponeScheduleRequestUsecase;
}
