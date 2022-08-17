import 'package:equatable/equatable.dart';

class DefaultEntity extends Equatable {
  const DefaultEntity({
    required this.status,
    required this.message,
  });

  final int status;
  final String message;

  @override
  List<Object?> get props => [status, message];
}
