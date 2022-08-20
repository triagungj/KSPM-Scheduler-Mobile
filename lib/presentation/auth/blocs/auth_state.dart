part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  const AuthFailure({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess({required this.data});

  final LoginEntity data;

  @override
  List<Object> get props => [];
}

class LogoutSuccess extends AuthState {
  const LogoutSuccess(this.response);

  final DefaultEntity response;

  @override
  List<Object> get props => [response];
}

class ChangePasswordSuccess extends AuthState {
  const ChangePasswordSuccess(this.response);

  final DefaultEntity response;

  @override
  List<Object> get props => [response];
}
