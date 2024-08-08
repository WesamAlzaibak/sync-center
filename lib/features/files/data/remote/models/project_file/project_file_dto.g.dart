// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFileDto _$ProjectFileDtoFromJson(Map<String, dynamic> json) =>
    ProjectFileDto(
      url: json['url'] as String,
      id: (json['id'] as num).toInt(),
      // userName: json['userName'] as String,
      // userPicture: json['userPicture'] as String? ??
      //     '',
      // date: json['createdAt'] as String,
    );

Map<String, dynamic> _$ProjectFileDtoToJson(ProjectFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      // 'userName': instance.userName,
      // 'userPicture': instance.userPicture,
      // 'createdAt': instance.date,
    };
