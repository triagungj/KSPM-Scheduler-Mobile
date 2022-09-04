// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCountValidationModel _$ListCountValidationModelFromJson(
        Map<String, dynamic> json) =>
    ListCountValidationModel(
      status: json['status'] as int,
      data: ListCountValidationDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

ListCountValidationDataModel _$ListCountValidationDataModelFromJson(
        Map<String, dynamic> json) =>
    ListCountValidationDataModel(
      pengurus: ResultCountValidationModel.fromJson(
          json['pengurus'] as Map<String, dynamic>),
      anggota: ResultCountValidationModel.fromJson(
          json['anggota'] as Map<String, dynamic>),
    );

ResultCountValidationModel _$ResultCountValidationModelFromJson(
        Map<String, dynamic> json) =>
    ResultCountValidationModel(
      requested: json['requested'] as int,
      rejected: json['rejected'] as int,
      accepted: json['accepted'] as int,
      empty: json['empty'] as int,
      validated: json['validated'] as int,
      total: json['total'] as int,
    );
