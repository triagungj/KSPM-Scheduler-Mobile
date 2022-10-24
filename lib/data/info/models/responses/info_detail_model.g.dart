// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoDetailModel _$InfoDetailModelFromJson(Map<String, dynamic> json) =>
    InfoDetailModel(
      status: json['status'] as int,
      data: InfoDetailDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

InfoDetailDataModel _$InfoDetailDataModelFromJson(Map<String, dynamic> json) =>
    InfoDetailDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
    );
