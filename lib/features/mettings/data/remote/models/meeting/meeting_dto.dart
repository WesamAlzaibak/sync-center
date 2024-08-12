import 'package:json_annotation/json_annotation.dart';

part 'meeting_dto.g.dart';

@JsonSerializable()
class MeetingDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String endDate;

  MeetingDto({
    required this.title,
    required this.description,
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  factory MeetingDto.fromJson(Map<String, dynamic> json) =>
      _$MeetingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingDtoToJson(this);
}
