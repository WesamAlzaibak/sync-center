import 'package:sync_center_mobile/features/tasks/data/remote/models/task/task_dto.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';

import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/entities/employee.dart';
import '../../../domain/enums/task_type.dart';
import '../models/empolyee/employee_dto.dart';

extension TaskDtoX on TaskDto {
  Task toTask() => Task(
      title: title,
      id: id,
      type: returnTaskType(type),
      employees: employees.map((e) => e.toEmployee()).toList(),
      startDate: startDate,
      description: description,
      endDate: endDate,
      totalDuration: totalDuration);
}

extension TaskListX on List<TaskDto> {
  List<Task> toTasks() => map((e) => e.toTask()).toList();
}

extension EmployeeDtoX on EmployeeDto {
  Employee toEmployee() => Employee(
        id: id,
        name: name,
        image: image.replaceAll("http://192.168.146.1:8000", ApiRoutes.devApi),
      );
}

TaskType returnTaskType(String type) {
  if (type == "To Do") {
    return TaskType.toDo;
  } else if (type == "Doing") {
    return TaskType.inProgress;
  } else if (type == "To Check") {
    return TaskType.toReview;
  } else {
    return TaskType.done;
  }
}
