import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.status,
    required this.isPetugas,
    this.isSuperuser,
    required this.message,
    required this.token,
  });

  final int status;
  final bool isPetugas;
  final bool? isSuperuser;
  final String message;
  final String token;

  @override
  List<Object?> get props => [status, isPetugas, isSuperuser, message, token];
}
