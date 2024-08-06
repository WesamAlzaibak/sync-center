import 'package:sync_center_mobile/features/tasks/data/remote/models/task/task_dto.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';

extension TaskDtoX on TaskDto {
  Task toTask() => Task(
        title: title,
        id: id,
        type: type,
        employeeName: employeeName,
    finishDate:  DateTime.parse(date),
        description: description,
      );
}

extension ProjectsListX on List<TaskDto> {
  List<Task> toTasks() => map((e) => e.toTask()).toList();
}
