import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required int status,
    required ProfileDataModel data,
  }) : super(
          status: status,
          data: data,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProfileDataModel extends ProfileDataEntity {
  const ProfileDataModel({
    required String name,
    required String phoneNumber,
    String? jabatan,
    String? jabatanId,
    String? memberId,
    String? avatarUrl,
  }) : super(
          name: name,
          phoneNumber: phoneNumber,
          jabatan: jabatan,
          jabatanId: jabatanId,
          memberId: memberId,
          avatarUrl: avatarUrl,
        );

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);
}
