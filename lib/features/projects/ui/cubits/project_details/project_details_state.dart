import 'package:equatable/equatable.dart';

import '../../../domain/entities/project.dart';


class ProjectDetailsState extends Equatable {
  const ProjectDetailsState();

  ProjectDetailsState copy() => const ProjectDetailsState();

  @override
  List<Object?> get props => [];
}

class ProjectDetailsInitialState extends ProjectDetailsState {
  const ProjectDetailsInitialState();

  @override
  ProjectDetailsInitialState copy() => const ProjectDetailsInitialState();

  @override
  List<Object> get props => [];
}

class ProjectDetailsErrorState extends ProjectDetailsState {
  final Exception exception;

  @override
  const ProjectDetailsErrorState({required this.exception});

  @override
  ProjectDetailsErrorState copy({Exception? exception}) =>
      ProjectDetailsErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class ProjectDetailsLoadingState extends ProjectDetailsState {
  const ProjectDetailsLoadingState();

  @override
  ProjectDetailsLoadingState copy() => const ProjectDetailsLoadingState();

  @override
  List<Object> get props => [];
}

class ProjectDetailsSuccessState extends ProjectDetailsState {
  final Project project;

  const ProjectDetailsSuccessState({
    required this.project,
  });

  @override
  ProjectDetailsSuccessState copy({
    Project? project,
  }) =>
      ProjectDetailsSuccessState(
          project: project ?? this.project);

  @override
  List<Object> get props => [project];
}
