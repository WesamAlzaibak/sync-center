// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingDto _$MeetingDtoFromJson(Map<String, dynamic> json) => MeetingDto(
  title: json['title'] as String,
  description: json['description'] as String,
  id: (json['id'] as num).toInt(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
);

Map<String, dynamic> _$MeetingDtoToJson(MeetingDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'start_date': instance.startDate,
  'end_date': instance.endDate
};

