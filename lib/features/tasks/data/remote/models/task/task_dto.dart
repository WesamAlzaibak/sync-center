import 'package:json_annotation/json_annotation.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "type")
  final TaskType type;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "employeeName")
  final String employeeName;
  @JsonKey(name: "taskDate")
  final String date;

  TaskDto({
    required this.title,
    required this.type,
    required this.description,
    required this.id,
    required this.employeeName,
    required this.date,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
