// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_projects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProjectsDto _$UserProjectsDtoFromJson(Map<String, dynamic> json) => UserProjectsDto(
  name: json['name'] as String,
  createdDate: json['created_at'] as String,
  id: (json['id'] as num).toInt(),
  logo: json['logo'] as String? ??
      '',
);

Map<String, dynamic> _$UserProjectsDtoToJson(UserProjectsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdDate,
      'logo': instance.logo,
    };
