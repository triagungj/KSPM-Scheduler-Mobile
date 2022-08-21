import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/usecases/get_list_session_usecase.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit(
    this.getListSessionUsecase,
  ) : super(InitialScheduleState());

  Future<void> getListSession() async {
    emit(LoadingScheduleState());

    final failureOrSuccess = await getListSessionUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureScheduleState(l.message)),
      (r) => emit(SuccessGetListSessionState(r.data)),
    );
  }

  final GetListSessionUsecase getListSessionUsecase;
}
