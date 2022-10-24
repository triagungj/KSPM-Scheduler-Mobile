// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      status: json['status'] as int,
      data: InfoDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

InfoDataModel _$InfoDataModelFromJson(Map<String, dynamic> json) =>
    InfoDataModel(
      data: (json['data'] as List<dynamic>)
          .map((dynamic e) =>
              InfoDetailDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['last_page'] as int,
      total: json['total'] as int,
    );
