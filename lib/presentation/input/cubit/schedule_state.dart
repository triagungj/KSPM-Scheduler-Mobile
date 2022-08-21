part of 'schedule_cubit.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class InitialScheduleState extends ScheduleState {}

class LoadingScheduleState extends ScheduleState {}

class FailureScheduleState extends ScheduleState {
  const FailureScheduleState(this.message);

  final String message;
}

class SuccessGetListSessionState extends ScheduleState {
  const SuccessGetListSessionState(this.data);

  final List<SessionDataEntity> data;
}
