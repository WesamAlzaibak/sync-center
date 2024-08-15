import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "body")
  final String description;
  @JsonKey(name: "updatedAt")
  final String date;
  @JsonKey(name: "is_seen")
  final bool isSeen;

  NotificationDto({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isSeen,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);
}
