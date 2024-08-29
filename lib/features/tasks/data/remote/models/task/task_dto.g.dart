// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      title: json['title'] as String,
      type: json['status_translation'] as String,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      employees: (json['employees'] as List<dynamic>?)
          ?.map(
              (e) => EmployeeDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      totalDuration: json['total_duration'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status_translation': instance.type,
      'employeeName': instance.employees,
      'total_duration': instance.totalDuration,
      'start_date': instance.startDate,
      'end_date': instance.endDate
    };

