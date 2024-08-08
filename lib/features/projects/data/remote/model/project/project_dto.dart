import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "todo_count")
  final int todoCount;
  @JsonKey(name: "doing_count")
  final int inProgressCount;
  @JsonKey(name: "tocheck_count")
  final int toReviewCount;
  @JsonKey(name: "done_count")
  final int doneCount;
  @JsonKey(name: "created_at")
  final String createdDate;
  @JsonKey(
      name: "logo",
      defaultValue:
          "https://png.pngtree.com/png-clipart/20190918/ourmid/pngtree-load-the-3273350-png-image_1733730.jpg")
  final String logo;

  ProjectDto({
    required this.name,
    required this.todoCount,
    required this.inProgressCount,
    required this.toReviewCount,
    required this.doneCount,
    required this.createdDate,
    required this.id,
    required this.logo,
    required this.description,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
}
