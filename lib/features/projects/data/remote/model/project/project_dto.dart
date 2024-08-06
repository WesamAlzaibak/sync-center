import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "companyName")
  final String companyName;
  @JsonKey(name: "companyPicture")
  final String companyPicture;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(
      name: "projectLogo",
      defaultValue:
          "https://png.pngtree.com/png-clipart/20190918/ourmid/pngtree-load-the-3273350-png-image_1733730.jpg")
  final String projectLogo;

  ProjectDto(
      {required this.title,
      required this.companyName,
      required this.companyPicture,
      required this.id,
      required this.description,
      required this.projectLogo});

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
}
