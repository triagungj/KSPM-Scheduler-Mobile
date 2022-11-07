import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.status,
    required this.isPetugas,
    required this.message,
    required this.token,
    this.updated,
  });

  final int status;
  final bool isPetugas;
  final String message;
  final String token;
  final bool? updated;

  @override
  List<Object?> get props => [
        status,
        isPetugas,
        message,
        token,
        updated,
      ];
}
