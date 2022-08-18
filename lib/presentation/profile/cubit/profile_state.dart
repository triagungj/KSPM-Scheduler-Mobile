part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class FailureProfileState extends ProfileState {
  const FailureProfileState(this.message);

  final String message;
}

class SuccessGetProfileState extends ProfileState {
  const SuccessGetProfileState(this.data);

  final ProfileDataEntity data;
}
