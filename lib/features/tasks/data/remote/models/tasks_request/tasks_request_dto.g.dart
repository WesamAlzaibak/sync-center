// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksRequestDto _$TasksRequestDtoFromJson(Map<String, dynamic> json) =>
    TasksRequestDto(
      projectId: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$TasksRequestDtoToJson(TasksRequestDto instance) =>
    <String, dynamic>{
      'id': instance.projectId,
    };
