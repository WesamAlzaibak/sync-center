import 'package:equatable/equatable.dart';
import 'package:sync_center_mobile/features/files/domain/entities/project_file.dart';

class ProjectFilesState extends Equatable {
  const ProjectFilesState();

  ProjectFilesState copy() => const ProjectFilesState();

  @override
  List<Object?> get props => [];
}

class ProjectFilesInitialState extends ProjectFilesState {
  const ProjectFilesInitialState();

  @override
  ProjectFilesInitialState copy() => const ProjectFilesInitialState();

  @override
  List<Object> get props => [];
}

class ProjectFilesErrorState extends ProjectFilesState {
  final Exception exception;

  @override
  const ProjectFilesErrorState({required this.exception});

  @override
  ProjectFilesErrorState copy({Exception? exception}) => ProjectFilesErrorState(
        exception: exception ?? this.exception,
      );

  @override
  List<Object> get props => [exception];
}

class ProjectFilesLoadingState extends ProjectFilesState {
  const ProjectFilesLoadingState();

  @override
  ProjectFilesLoadingState copy() => const ProjectFilesLoadingState();

  @override
  List<Object> get props => [];
}

class ProjectFilesSuccessState extends ProjectFilesState {
  final List<ProjectFile> files;

  const ProjectFilesSuccessState({required this.files});

  @override
  ProjectFilesSuccessState copy({
    List<ProjectFile>? files,
  }) =>
      ProjectFilesSuccessState(
        files: files ?? this.files,
      );

  @override
  List<Object> get props => [files];
}

class NoFilesState extends ProjectFilesState {
  const NoFilesState();

  @override
  NoFilesState copy() => const NoFilesState();

  @override
  List<Object> get props => [];
}

class UploadProjectFileSuccessState extends ProjectFilesSuccessState {
  const UploadProjectFileSuccessState(
      {required super.files});
}

class UploadProjectFileLoadingState extends ProjectFilesSuccessState {
  const UploadProjectFileLoadingState(
      {required super.files});
}

class UploadProjectFileErrorState extends ProjectFilesSuccessState {
  final Exception exception;

  const UploadProjectFileErrorState(
      {
        required super.files,
        required this.exception});
}
