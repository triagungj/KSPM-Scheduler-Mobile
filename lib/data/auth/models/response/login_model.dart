import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/auth/entities/entities.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel({
    required int status,
    required bool isPetugas,
    required String message,
    required String token,
    bool? updated,
  }) : super(
          status: status,
          isPetugas: isPetugas,
          message: message,
          token: token,
          updated: updated,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
