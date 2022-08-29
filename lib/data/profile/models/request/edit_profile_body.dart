import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_body.g.dart';

@JsonSerializable(createFactory: false)
class EditProfileBody {
  const EditProfileBody({
    required this.name,
    this.memberId,
    this.phoneNumber,
    this.image,
  });

  final String name;
  final String? memberId;
  final String? phoneNumber;
  final String? image;

  Map<String, dynamic> toJson() => _$EditProfileBodyToJson(this);
}
