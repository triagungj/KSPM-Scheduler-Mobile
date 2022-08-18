import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getProfileUsecase,
  ) : super(InitialProfileState());

  Future<void> getProfile() async {
    emit(LoadingProfileState());

    final failureOrSuccess = await getProfileUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureProfileState(l.message)),
      (r) => emit(SuccessGetProfileState(r.data)),
    );
  }

  final GetProfileUsecase getProfileUsecase;
}
