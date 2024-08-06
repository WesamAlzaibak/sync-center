import 'package:equatable/equatable.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';

import '../../../../tasks/domain/enums/task_type.dart';

class ProjectTasksState extends Equatable {
  final TaskType currentType;

  const ProjectTasksState({required this.currentType});

  ProjectTasksState copy({TaskType? currentType}) => ProjectTasksState(
        currentType: currentType ?? this.currentType,
      );

  @override
  List<Object?> get props => [currentType];
}

class ProjectTasksInitialState extends ProjectTasksState {
  const ProjectTasksInitialState({required super.currentType});

  @override
  ProjectTasksInitialState copy({TaskType? currentType}) =>
      ProjectTasksInitialState(
        currentType: currentType ?? this.currentType,
      );

  @override
  List<Object> get props => [currentType];
}

class ProjectTasksErrorState extends ProjectTasksState {
  final Exception exception;

  @override
  const ProjectTasksErrorState({
    required this.exception,
    required super.currentType,
  });

  @override
  ProjectTasksErrorState copy({
    Exception? exception,
    TaskType? currentType,
  }) =>
      ProjectTasksErrorState(
        exception: exception ?? this.exception,
        currentType: currentType ?? this.currentType,
      );

  @override
  List<Object> get props => [
        exception,
        currentType,
      ];
}

class ProjectTasksLoadingState extends ProjectTasksState {
  const ProjectTasksLoadingState({required super.currentType});

  @override
  ProjectTasksLoadingState copy({TaskType? currentType}) =>
      ProjectTasksLoadingState(
        currentType: currentType ?? this.currentType,
      );

  @override
  List<Object> get props => [
        currentType,
      ];
}

class ProjectTasksSuccessState extends ProjectTasksState {
  final List<Task> tasks;

  const ProjectTasksSuccessState({
    required this.tasks,
    required super.currentType,
  });

  @override
  ProjectTasksSuccessState copy({
    List<Task>? tasks,
    TaskType? currentType,
  }) =>
      ProjectTasksSuccessState(
        tasks: tasks ?? this.tasks,
        currentType: currentType ?? this.currentType,
      );

  @override
  List<Object> get props => [
        tasks,
        currentType,
      ];
}
