import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_count_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/list_validation_entity.dart';
import 'package:kspm_scheduler_mobile/domain/validation/usecases/accept_validation_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/usecases/get_detail_validation_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/usecases/get_list_count_validation_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/usecases/get_list_validation_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/validation/usecases/reject_validation_usecase.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit(
    this.getListCountValidationUsecase,
    this.getListValidationUsecase,
    this.getDetailValidationUsecase,
    this.rejectValidationUsecase,
    this.acceptValidationUsecase,
  ) : super(InitialValidationState());

  Future<void> getListCountValidation() async {
    emit(LoadingValidationState());

    final failureOrSuccess =
        await getListCountValidationUsecase.call(NoParams());

    failureOrSuccess.fold(
      (l) => emit(FailureValidationState(l.message)),
      (r) => emit(SuccessLoadCountValidationState(r.data)),
    );
  }

  Future<void> getListValidation(ValidationTypeBody body) async {
    emit(LoadingValidationState());

    final failureOrSuccess = await getListValidationUsecase.call(body);

    failureOrSuccess.fold(
      (l) => emit(FailureValidationState(l.message)),
      (r) => emit(SuccessLoadListValidationState(r.data)),
    );
  }

  Future<void> getDetailValidation(String params) async {
    emit(LoadingValidationState());

    final failureOrSuccess = await getDetailValidationUsecase.call(params);

    failureOrSuccess.fold(
      (l) => emit(FailureValidationState(l.message)),
      (r) => emit(SuccessLoadDetailValidationState(r.data)),
    );
  }

  Future<void> rejectValidation(RejectValidationBody body) async {
    emit(LoadingValidationState());

    final failureOrSuccess = await rejectValidationUsecase.call(body);

    failureOrSuccess.fold(
      (l) => emit(FailureValidationState(l.message)),
      (r) => emit(SuccessRejectValidationState(r.message)),
    );
  }

  Future<void> acceptValidation(String param) async {
    emit(LoadingValidationState());

    final failureOrSuccess = await acceptValidationUsecase.call(param);

    failureOrSuccess.fold(
      (l) => emit(FailureValidationState(l.message)),
      (r) => emit(SuccessAcceptValidationState(r.message)),
    );
  }

  final GetListCountValidationUsecase getListCountValidationUsecase;
  final GetListValidationUsecase getListValidationUsecase;
  final GetDetailValidationUsecase getDetailValidationUsecase;
  final RejectValidationUsecase rejectValidationUsecase;
  final AcceptValidationUsecase acceptValidationUsecase;
}
