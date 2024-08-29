import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int id;
  final String name;
  final int todoCount;
  final int inProgressCount;
  final int toReviewCount;
  final int doneCount;
  final int filesCount;
  final DateTime createdDate;
  final String logo;
  final String description;

  const Project({
    required this.name,
    required this.createdDate,
    required this.todoCount,
    required this.id,
    required this.inProgressCount,
    required this.toReviewCount,
    required this.doneCount,
    required this.filesCount,
    required this.logo,
    required this.description,
  });

  @override
  List<Object> get props => [
        id,
        name,
        createdDate,
        todoCount,
        inProgressCount,
        toReviewCount,
        doneCount,
    filesCount,
        logo,
    description,
      ];
}
