import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kspm_scheduler_mobile/core/entities/default_entity.dart';
import 'package:kspm_scheduler_mobile/core/usecases/usecase.dart';
import 'package:kspm_scheduler_mobile/data/auth/models/models.dart';
import 'package:kspm_scheduler_mobile/domain/auth/entities/entities.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/change_password_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/logout_usecase.dart';
import 'package:kspm_scheduler_mobile/domain/auth/usecases/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.loginUsecase,
    this.logoutUsecase,
    this.changePasswordUsecase,
  ) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final failureOrLogin = await loginUsecase.call(event.body);
      failureOrLogin.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) {
          return emit(AuthSuccess(data: r));
        },
      );
    });
    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await logoutUsecase.call(NoParams());
      failureOrSuccess.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(LogoutSuccess(r)),
      );
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await changePasswordUsecase.call(event.body);
      failureOrSuccess.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(ChangePasswordSuccess(r)),
      );
    });
  }

  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final ChangePasswordUsecase changePasswordUsecase;
}
