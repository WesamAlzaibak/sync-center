import 'package:equatable/equatable.dart';

import '../../../../projects/domain/entities/user_projects.dart';
import '../../../domain/entities/company.dart';

class CompanyDetailsState extends Equatable {
  const CompanyDetailsState();

  CompanyDetailsState copy() => const CompanyDetailsState();

  @override
  List<Object?> get props => [];
}

class CompanyDetailsInitialState extends CompanyDetailsState {
  const CompanyDetailsInitialState();

  @override
  CompanyDetailsInitialState copy() => const CompanyDetailsInitialState();

  @override
  List<Object> get props => [];
}

class CompanyDetailsErrorState extends CompanyDetailsState {
  final Exception exception;

  @override
  const CompanyDetailsErrorState({required this.exception});

  @override
  CompanyDetailsErrorState copy({Exception? exception}) =>
      CompanyDetailsErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class CompanyDetailsLoadingState extends CompanyDetailsState {
  const CompanyDetailsLoadingState();

  @override
  CompanyDetailsLoadingState copy() => const CompanyDetailsLoadingState();

  @override
  List<Object> get props => [];
}

class CompanyDetailsSuccessState extends CompanyDetailsState {
  final Company company;
  final List<UserProjects> projects;

  const CompanyDetailsSuccessState({
    required this.company,
    required this.projects,
  });

  @override
  CompanyDetailsSuccessState copy({
    Company? company,
    List<UserProjects>? projects,
  }) =>
      CompanyDetailsSuccessState(
        company: company ?? this.company,
        projects: projects ?? this.projects,
      );

  @override
  List<Object> get props => [company, projects];
}
