import 'package:equatable/equatable.dart';

import '../enums/task_type.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String description;
  final String employeeName;
  final TaskType type;
  final DateTime finishDate;

  const Task({
    required this.title,
    required this.type,
    required this.description,
    required this.employeeName,
    required this.id,
    required this.finishDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        employeeName,
        type,
    finishDate,
      ];
}
