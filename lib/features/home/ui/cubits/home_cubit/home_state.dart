import 'package:equatable/equatable.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/user_projects.dart';


class HomeState extends Equatable {
  const HomeState(this.username);

  final String username;

  HomeState copy({String? username}) => HomeState(
        username ?? this.username,
      );

  @override
  List<Object?> get props => [username];
}

class HomeInitialState extends HomeState {
  const HomeInitialState(super.username);

  @override
  HomeInitialState copy({String? username}) =>
      HomeInitialState(username ?? this.username);

  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final Exception exception;

  @override
  const HomeErrorState(super.username, {required this.exception});

  @override
  HomeErrorState copy({Exception? exception, String? username}) =>
      HomeErrorState(
        username ?? this.username,
        exception: exception ?? this.exception,
      );

  @override
  List<Object> get props => [exception];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState(super.username);

  @override
  HomeLoadingState copy({String? username}) => HomeLoadingState(
        username ?? this.username,
      );

  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<UserProjects> projects;

  const HomeSuccessState(super.username, {required this.projects});

  @override
  HomeSuccessState copy({
    String? username,
    List<UserProjects>? projects,
  }) =>
      HomeSuccessState(
        username ?? this.username,
        projects: projects ?? this.projects,
      );

  @override
  List<Object> get props => [projects];
}

class NoProjectState extends HomeState {
  const NoProjectState(super.username);

  @override
  NoProjectState copy({String? username}) =>
      NoProjectState(username ?? this.username);

  @override
  List<Object> get props => [];
}
