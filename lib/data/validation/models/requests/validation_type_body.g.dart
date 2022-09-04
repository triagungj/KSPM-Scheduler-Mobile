// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_type_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ValidationTypeBodyToJson(ValidationTypeBody instance) =>
    <String, dynamic>{
      'partisipan_type': _$PartisipanTypeEnumMap[instance.partisipanType],
      'validation_type': _$ValidationTypeEnumMap[instance.validationType],
    };

const _$PartisipanTypeEnumMap = {
  PartisipanType.pengurus: 'pengurus',
  PartisipanType.anggota: 'anggota',
};

const _$ValidationTypeEnumMap = {
  ValidationType.requested: 'requested',
  ValidationType.rejected: 'rejected',
  ValidationType.empty: 'empty',
  ValidationType.validated: 'validated',
  ValidationType.accepted: 'accepted',
  ValidationType.all: 'all',
};
