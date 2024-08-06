// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      title: json['title'] as String,
      type: json['type'] as TaskType,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      employeeName: json["employeeName"] as String,
      date: json['taskDate'] as String,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'employeeName': instance.employeeName,
      'taskDate': instance.date,
    };
