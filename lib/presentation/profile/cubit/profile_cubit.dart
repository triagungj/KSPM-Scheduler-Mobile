import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/profile/models/request/edit_profile_body.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/edit_profile_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/get_list_jabatan_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/profile/usecases/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getProfileUsecase,
    this.editProfileUsecase,
    this.getListJabatanUsecase,
  ) : super(InitialProfileState());

  Future<void> getProfile() async {
    emit(LoadingProfileState());

    final failureOrSuccess = await getProfileUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureProfileState(l.message)),
      (r) => emit(SuccessGetProfileState(r.data)),
    );
  }

  Future<void> editProfile(EditProfileBody params) async {
    emit(LoadingProfileState());

    final failureOrSuccess = await editProfileUsecase.call(params);

    failureOrSuccess.fold(
      (l) => emit(FailureProfileState(l.message)),
      (r) => emit(SuccessEditProfileState(r)),
    );
  }

  Future<void> getListJabatan() async {
    emit(LoadingProfileState());

    final failureOrSuccess = await getListJabatanUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureGetListJabatanState(l.message)),
      (r) => emit(SuccessGetListJabatanState(r.data)),
    );
  }

  final GetProfileUsecase getProfileUsecase;
  final EditProfileUsecase editProfileUsecase;
  final GetListJabatanUsecase getListJabatanUsecase;
}
