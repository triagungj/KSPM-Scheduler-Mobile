part of 'info_cubit.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InitialInfoState extends InfoState {}

class LoadingInfoState extends InfoState {}

class FailureInfoState extends InfoState {
  const FailureInfoState(this.message);

  final String message;
}

class SuccessGetInfoListState extends InfoState {
  const SuccessGetInfoListState(this.data);

  final InfoDataEntity data;
}

class SuccessGetDetailInfoListState extends InfoState {
  const SuccessGetDetailInfoListState(this.data);

  final InfoDetailDataEntity data;
}
