import 'package:json_annotation/json_annotation.dart';

part 'user_projects_dto.g.dart';

@JsonSerializable()
class UserProjectsDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "created_at")
  final String createdDate;
  @JsonKey(
      name: "logo",
      defaultValue:
      "")
  final String logo;

  UserProjectsDto(
      {required this.name,
        required this.createdDate,
        required this.id,
        required this.logo});

  factory UserProjectsDto.fromJson(Map<String, dynamic> json) =>
      _$UserProjectsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProjectsDtoToJson(this);
}
