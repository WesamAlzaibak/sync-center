// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['body'] as String,
      date: json['updatedAt'] as String,
      isSeen: json['is_seen'] as bool,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.description,
      'updatedAt': instance.date,
      'is_seen': instance.isSeen
    };
