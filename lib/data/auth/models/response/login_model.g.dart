// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as int,
      isPetugas: json['is_petugas'] as bool,
      isSuperuser: json['is_superuser'] as bool?,
      message: json['message'] as String,
      token: json['token'] as String,
    );
