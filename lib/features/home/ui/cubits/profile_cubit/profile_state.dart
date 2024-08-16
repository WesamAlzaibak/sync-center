import 'package:equatable/equatable.dart';

import '../../../../auth/domain/models/profile.dart';
import '../../../../companies/domain/entities/company.dart';

class ProfileState extends Equatable {
  const ProfileState();

  ProfileState copy() => const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState();

  @override
  ProfileInitialState copy() => const ProfileInitialState();

  @override
  List<Object> get props => [];
}

class ProfileErrorState extends ProfileState {
  final Exception exception;

  @override
  const ProfileErrorState({required this.exception});

  @override
  ProfileErrorState copy({Exception? exception}) =>
      ProfileErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();

  @override
  ProfileLoadingState copy() => const ProfileLoadingState();

  @override
  List<Object> get props => [];
}

class ProfileSuccessState extends ProfileState {
  final Profile profile;
  final Company company;

  const ProfileSuccessState({required this.profile, required this.company});

  @override
  ProfileSuccessState copy({Profile? profile, Company? company}) =>
      ProfileSuccessState(
        profile: profile ?? this.profile,
        company: company ?? this.company,
      );

  @override
  List<Object> get props => [profile, company];
}


class LogoutLoadingState extends ProfileState {
  const LogoutLoadingState();

  @override
  LogoutLoadingState copy() => const LogoutLoadingState();

  @override
  List<Object> get props => [];
}

class LogoutErrorState extends ProfileState {
  final Exception exception;

  @override
  const LogoutErrorState({required this.exception});

  @override
  LogoutErrorState copy({Exception? exception}) =>
      LogoutErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class LogoutSuccessState extends ProfileState {
  const LogoutSuccessState();

  @override
  LogoutSuccessState copy() => const LogoutSuccessState();

  @override
  List<Object> get props => [];
}


class UpdateProfileLoadingState extends ProfileState {
  const UpdateProfileLoadingState();

  @override
  UpdateProfileLoadingState copy() => const UpdateProfileLoadingState();

  @override
  List<Object> get props => [];
}

class UpdateProfileErrorState extends ProfileState {
  final Exception exception;

  @override
  const UpdateProfileErrorState({required this.exception});

  @override
  UpdateProfileErrorState copy({Exception? exception}) =>
      UpdateProfileErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class UpdateProfileSuccessState extends ProfileState {
  const UpdateProfileSuccessState();

  @override
  UpdateProfileSuccessState copy() => const UpdateProfileSuccessState();

  @override
  List<Object> get props => [];
}