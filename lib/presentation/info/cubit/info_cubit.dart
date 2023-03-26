import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_entity.dart';
import 'package:kspm_scheduler_mobile/domain/info/usecases/get_info_detail_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/info/usecases/get_info_list_usecase.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(
    this.getInfoListUsecase,
    this.getInfoDetailUsecase,
  ) : super(InitialInfoState());

  Future<void> getInfoList(int page) async {
    emit(LoadingInfoState());

    final failureOrSuccess = await getInfoListUsecase.call(page);

    failureOrSuccess.fold(
      (l) => emit(FailureInfoState(l.message)),
      (r) => emit(SuccessGetInfoListState(r.data)),
    );
  }

  Future<void> getInfo(String id) async {
    emit(LoadingInfoState());

    final failureOrSuccess = await getInfoDetailUsecase.call(id);

    failureOrSuccess.fold(
      (l) => emit(FailureInfoState(l.message)),
      (r) => emit(SuccessGetDetailInfoListState(r.data)),
    );
  }

  final GetInfoListUsecase getInfoListUsecase;
  final GetInfoDetailUsecase getInfoDetailUsecase;
}
