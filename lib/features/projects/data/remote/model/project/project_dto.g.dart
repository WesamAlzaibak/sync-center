// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
      name: json['name'] as String,
      createdDate: json['created_at'] as String,
      id: (json['id'] as num).toInt(),
      todoCount: (json['todo_count'] as num).toInt(),
      inProgressCount: (json['doing_count'] as num).toInt(),
      toReviewCount: (json['tocheck_count'] as num).toInt(),
      doneCount: (json['done_count'] as num).toInt(),
      logo: json['logo'] as String? ??
          'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdDate,
      'logo': instance.logo,
      'todo_count': instance.todoCount,
      'doing_count': instance.inProgressCount,
      'tocheck_count': instance.toReviewCount,
      'done_count': instance.doneCount,
      'description': instance.description,
    };
