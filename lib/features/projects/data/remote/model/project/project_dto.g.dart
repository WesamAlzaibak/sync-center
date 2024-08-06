// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
      title: json['title'] as String,
      companyName: json['companyName'] as String,
      id: (json['id'] as num).toInt(),
      projectLogo: json['projectLogo'] as String? ??
          'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
      companyPicture: json['companyPicture'] as String? ??
          'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'companyName': instance.companyName,
      'companyPicture': instance.companyPicture,
      'description': instance.description,
      'projectLogo': instance.projectLogo,
    };
