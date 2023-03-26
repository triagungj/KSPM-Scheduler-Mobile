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

class FailureGetListJabatanState extends ProfileState {
  const FailureGetListJabatanState(this.message);

  final String message;
}

class SuccessGetProfileState extends ProfileState {
  const SuccessGetProfileState(this.data);

  final ProfileDataEntity data;
}

class SuccessEditProfileState extends ProfileState {
  const SuccessEditProfileState(this.data);

  final DefaultEntity data;
}

class SuccessGetListJabatanState extends ProfileState {
  const SuccessGetListJabatanState(this.data);

  final List<JabatanDataEntity> data;
}


