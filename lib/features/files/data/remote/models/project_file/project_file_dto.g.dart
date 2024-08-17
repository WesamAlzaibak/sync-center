// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFileDto _$ProjectFileDtoFromJson(Map<String, dynamic> json) =>
    ProjectFileDto(
      url: json['url'] as String,
      id: (json['id'] as num).toInt(),
      userName: json['creator_name'] as String,
      userPicture: json['creator_name'] as String? ??
          '',
      date: json['created_at'] as String,
    );

Map<String, dynamic> _$ProjectFileDtoToJson(ProjectFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'creator_name': instance.userName,
      'creator_image': instance.userPicture,
      'created_at': instance.date,
    };
