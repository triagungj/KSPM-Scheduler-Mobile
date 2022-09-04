part of 'validation_cubit.dart';

abstract class ValidationState extends Equatable {
  const ValidationState();

  @override
  List<Object> get props => [];
}

class InitialValidationState extends ValidationState {}

class LoadingValidationState extends ValidationState {}

class FailureValidationState extends ValidationState {
  const FailureValidationState(this.message);

  final String message;
}

class SuccessLoadCountValidationState extends ValidationState {
  const SuccessLoadCountValidationState(this.data);

  final ListCountValidationDataEntity data;
}

class SuccessLoadListValidationState extends ValidationState {
  const SuccessLoadListValidationState(this.data);

  final ListValidationDataEntity data;
}

class SuccessLoadDetailValidationState extends ValidationState {
  const SuccessLoadDetailValidationState(this.data);

  final DetailValidationDataEntity data;
}

class SuccessRejectValidationState extends ValidationState {
  const SuccessRejectValidationState(this.message);

  final String message;
}
class SuccessAcceptValidationState extends ValidationState {
  const SuccessAcceptValidationState(this.message);

  final String message;
}
