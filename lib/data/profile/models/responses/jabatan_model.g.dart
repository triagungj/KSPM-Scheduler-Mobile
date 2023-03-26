// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jabatan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JabatanModel _$JabatanModelFromJson(Map<String, dynamic> json) => JabatanModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((dynamic e) =>
              JabatanDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

JabatanDataModel _$JabatanDataModelFromJson(Map<String, dynamic> json) =>
    JabatanDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
