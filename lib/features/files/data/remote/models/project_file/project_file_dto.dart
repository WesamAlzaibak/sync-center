import 'package:json_annotation/json_annotation.dart';

part 'project_file_dto.g.dart';

@JsonSerializable()
class ProjectFileDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "userName")
  final String userName;
  @JsonKey(
      name: "creator_image",
      defaultValue:
      "")
  final String userPicture;
  @JsonKey(name: "created_at")
  final String date;

  ProjectFileDto({
    required this.url,
    required this.id,
    required this.userName,
    required this.userPicture,
    required this.date,
  });

  factory ProjectFileDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectFileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectFileDtoToJson(this);
}
