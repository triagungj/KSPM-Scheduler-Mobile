// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListValidationModel _$ListValidationModelFromJson(Map<String, dynamic> json) =>
    ListValidationModel(
      status: json['status'] as int,
      data: ListValidationDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

ListValidationDataModel _$ListValidationDataModelFromJson(
        Map<String, dynamic> json) =>
    ListValidationDataModel(
      validationType:
          $enumDecode(_$ValidationTypeEnumMap, json['validation_type']),
      total: json['total'] as int,
      listRequest: (json['list_request'] as List<dynamic>)
          .map((dynamic e) =>
              ValidationDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$ValidationTypeEnumMap = {
  ValidationType.requested: 'requested',
  ValidationType.rejected: 'rejected',
  ValidationType.empty: 'empty',
  ValidationType.validated: 'validated',
  ValidationType.accepted: 'accepted',
  ValidationType.all: 'all',
};

ValidationDataModel _$ValidationDataModelFromJson(Map<String, dynamic> json) =>
    ValidationDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
