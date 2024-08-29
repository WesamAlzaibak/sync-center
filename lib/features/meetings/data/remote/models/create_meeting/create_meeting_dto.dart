import 'package:json_annotation/json_annotation.dart';

part 'create_meeting_dto.g.dart';

@JsonSerializable()
class CreateMeetingDto {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "start_date")
  final String date;
  @JsonKey(name: "company_id")
  final int companyId;

  CreateMeetingDto({
    required this.title,
    required this.date,
    required this.companyId,
  });

  factory CreateMeetingDto.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMeetingDtoToJson(this);
}
