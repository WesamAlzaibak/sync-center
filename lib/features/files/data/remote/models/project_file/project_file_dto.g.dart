// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFileDto _$ProjectFileDtoFromJson(Map<String, dynamic> json) => ProjectFileDto(
  url: json['url'] as String,
  userName: json['userName'] as String,
  id: (json['id'] as num).toInt(),
  userPicture: json['userPicture'] as String? ??
      'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
  date: json['createdAt'] as String,
);

Map<String, dynamic> _$ProjectFileDtoToJson(ProjectFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'url': instance.url,
      'userPicture': instance.userPicture,
      'createdAt': instance.date,
    };
