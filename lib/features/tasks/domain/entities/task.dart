import 'package:equatable/equatable.dart';

import '../enums/task_type.dart';
import 'employee.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String description;
  final TaskType type;
  final String startDate;
  final String endDate;
  final List<Employee> employees;
  final String totalDuration;

  const Task({
    required this.title,
    required this.type,
    required this.description,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.employees,
    required this.totalDuration,
  });

  @override
  List<Object> get props => [
        id,
        title,
        employees,
        description,
        type,
        startDate,
        endDate,
        totalDuration,
      ];
}
