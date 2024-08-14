// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meeting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMeetingDto _$CreateMeetingDtoFromJson(Map<String, dynamic> json) => CreateMeetingDto(
  title: json['title'] as String,
  date: json['start_date'] as String,
  companyId: (json['company_id'] as num).toInt(),
);

Map<String, dynamic> _$CreateMeetingDtoToJson(CreateMeetingDto instance) =>
    <String, dynamic>{
      'start_date': instance.date,
      'title': instance.title,
      'company_id': instance.companyId
    };
