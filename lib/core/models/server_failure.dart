import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/core/error/failures.dart';

part 'server_failure.g.dart';

// General failures
@JsonSerializable(createToJson: false)
class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromJson(Map<String, dynamic> json) =>
      _$ServerFailureFromJson(json);

  @override
  List<Object?> get props => [message];
}
