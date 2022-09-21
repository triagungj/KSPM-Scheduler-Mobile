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

class SuccessLoadListMyScheduleState extends ScheduleState {
  const SuccessLoadListMyScheduleState(this.data);

  final ListMyScheduleDataEntity data;
}

class SuccessLoadListScheduleState extends ScheduleState {
  const SuccessLoadListScheduleState(this.data);

  final ListScheduleDataEntity? data;
}

class SuccessLoadListDetailScheduleState extends ScheduleState {
  const SuccessLoadListDetailScheduleState(this.data);

  final List<DetailScheduleEntity> data;
}

class SuccessLoadDetailScheduleSessionState extends ScheduleState {
  const SuccessLoadDetailScheduleSessionState(this.data);

  final DetailScheduleSessionDataEntity data;
}

class LoadingGenerateScheduleState extends ScheduleState {}

class FailureGenerateScheduleState extends ScheduleState {
  const FailureGenerateScheduleState(this.message);

  final String message;
}

class SuccessGenerateScheduleState extends ScheduleState {
  const SuccessGenerateScheduleState(this.message);

  final String message;
}
