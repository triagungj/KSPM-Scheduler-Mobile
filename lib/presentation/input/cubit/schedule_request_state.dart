part of 'schedule_request_cubit.dart';

abstract class ScheduleRequestState extends Equatable {
  const ScheduleRequestState();

  @override
  List<Object> get props => [];
}

class InitialScheduleRequestState extends ScheduleRequestState {}

class LoadingScheduleRequestState extends ScheduleRequestState {}

class FailureScheduleRequestState extends ScheduleRequestState {
  const FailureScheduleRequestState(this.message);

  final String message;
}

class SuccessGetListSessionState extends ScheduleRequestState {
  const SuccessGetListSessionState(this.data);

  final List<SessionDataEntity> data;
}

class SuccessSaveScheduleRequestState extends ScheduleRequestState {
  const SuccessSaveScheduleRequestState(this.message);

  final String message;
}

class SuccessSendScheduleRequestState extends ScheduleRequestState {
  const SuccessSendScheduleRequestState(this.message);

  final String message;
}

class SuccessLoadListMySessionState extends ScheduleRequestState {
  const SuccessLoadListMySessionState(this.data);

  final ScheduleRequestDataEntity data;
}

class SuccessPostponeScheduleRequest extends ScheduleRequestState {
  const SuccessPostponeScheduleRequest(this.message);

  final String message;
}
