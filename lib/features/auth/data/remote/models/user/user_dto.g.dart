// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      name: json['name'] as String,
      companyId: (json['company_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) =>
    <String, dynamic>{'name': instance.name, 'company_id': instance.companyId};
