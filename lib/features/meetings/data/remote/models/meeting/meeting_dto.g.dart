// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingDto _$MeetingDtoFromJson(Map<String, dynamic> json) => MeetingDto(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      startDate: json['start_date'] as String,
      statusName: StatusNameDto.fromJson(json['status_name'] as String),
      requesterType: json["requester_type"] as String,
      company: CompanyDto.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingDtoToJson(MeetingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_date': instance.startDate,
      'status_name': instance.statusName,
      "requester_type": instance.requesterType,
      "company": instance.company,
    };
