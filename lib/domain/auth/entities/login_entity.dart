import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.status,
    required this.message,
    required this.token,
  });

  final int status;
  final String message;
  final String token;

  @override
  List<Object?> get props => [status, message, token];
}
