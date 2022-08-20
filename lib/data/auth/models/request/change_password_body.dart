import 'package:json_annotation/json_annotation.dart';

part 'change_password_body.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordBody {
  const ChangePasswordBody({
    required this.oldPassword,
    required this.newPassword,
  });

  final String oldPassword;
  final String newPassword;

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
