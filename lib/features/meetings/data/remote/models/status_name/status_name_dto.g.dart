// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusNameDto _$StatusNameDtoFromJson(Map<String, dynamic> json) => StatusNameDto(
  statusName: $enumDecode(_$StatusNameEnumMap, json['status_name']),
);

Map<String, dynamic> _$StatusNameDtoToJson(StatusNameDto instance) => <String, dynamic>{
  'status_name': _$StatusNameEnumMap[instance.statusName]!,
};

const _$StatusNameEnumMap = {
  StatusNameEnum.pending: 'PENDING',
  StatusNameEnum.rejected: 'REJECTED',
  StatusNameEnum.accepted:'ACCEPTED'
};
