// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_system_entries_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSystemEntriesDto _$UserSystemEntriesDtoFromJson(Map<String, dynamic> json) =>
    UserSystemEntriesDto(
      name: json['name'] as String,
      token: json['access_token'] as String,
    );

Map<String, dynamic> _$UserSystemEntriesDtoToJson(UserSystemEntriesDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'access_token': instance.token,
    };