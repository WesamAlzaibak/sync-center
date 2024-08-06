// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_system_entries_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSystemEntriesDto _$UserSystemEntriesDtoFromJson(
        Map<String, dynamic> json) =>
    UserSystemEntriesDto(
      userDto: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserSystemEntriesDtoToJson(
        UserSystemEntriesDto instance) =>
    <String, dynamic>{
      'user': instance.userDto,
      'token': instance.token,
    };
