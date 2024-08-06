import 'package:equatable/equatable.dart';

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

  const CompanyDetailsSuccessState({
    required this.company,
  });

  @override
  CompanyDetailsSuccessState copy({
    Company? company,
  }) =>
      CompanyDetailsSuccessState(
        company: company ?? this.company,
      );

  @override
  List<Object> get props => [company];
}
