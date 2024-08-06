import 'package:json_annotation/json_annotation.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

part 'tasks_request_dto.g.dart';

@JsonSerializable()
class TasksRequestDto {
  @JsonKey(name: "id")
  final int projectId;

  TasksRequestDto({
    required this.projectId,
  });

  factory TasksRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TasksRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TasksRequestDtoToJson(this);
}
