import 'package:json_annotation/json_annotation.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

import '../empolyee/employee_dto.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "status_translation")
  final String type;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "employees")
  final List<EmployeeDto> employees;
  @JsonKey(name: "total_duration")
  final String totalDuration;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String endDate;

  TaskDto({
    required this.title,
    required this.type,
    required this.description,
    required this.id,
    required this.employees,
    required this.totalDuration,
    required this.startDate,
    required this.endDate,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
