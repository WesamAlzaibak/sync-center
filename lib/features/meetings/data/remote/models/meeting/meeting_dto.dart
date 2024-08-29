import 'package:json_annotation/json_annotation.dart';

import '../../../../../companies/data/remote/model/company/company_dto.dart';
import '../status_name/status_name_dto.dart';

part 'meeting_dto.g.dart';

@JsonSerializable()
class MeetingDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "status_name")
  final StatusNameDto statusName;
  @JsonKey(name: "requester_type")
  final String requesterType;
  @JsonKey(name: "company")
  final CompanyDto company;

  MeetingDto({
    required this.title,
    required this.id,
    required this.startDate,
    required this.statusName,
    required this.requesterType,
    required this.company,
  });

  factory MeetingDto.fromJson(Map<String, dynamic> json) =>
      _$MeetingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingDtoToJson(this);
}
