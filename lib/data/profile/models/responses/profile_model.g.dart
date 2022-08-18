// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      status: json['status'] as int,
      data: ProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      jabatan: json['jabatan'] as String?,
      memberId: json['member_id'] as String?,
    );
