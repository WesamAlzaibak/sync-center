import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  final bool obscurePassword;
  final bool obscureConfirmPassword;

  const ResetPasswordState(
      {this.obscurePassword = true, this.obscureConfirmPassword = true});

  ResetPasswordState copy(
          {bool? obscurePassword, bool? obscureConfirmPassword}) =>
      ResetPasswordState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword);

  @override
  List<Object?> get props => [obscurePassword, obscureConfirmPassword];
}

class ResetPasswordInitialState extends ResetPasswordState {
  const ResetPasswordInitialState(
      {super.obscurePassword, super.obscureConfirmPassword});

  @override
  ResetPasswordInitialState copy(
          {bool? obscurePassword, bool? obscureConfirmPassword}) =>
      ResetPasswordInitialState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword);

  @override
  List<Object> get props => [obscurePassword, obscureConfirmPassword];
}

class ResetPasswordLoadingState extends ResetPasswordState {
  const ResetPasswordLoadingState(
      {super.obscurePassword, super.obscureConfirmPassword});

  @override
  ResetPasswordLoadingState copy(
          {bool? obscurePassword, bool? obscureConfirmPassword}) =>
      ResetPasswordLoadingState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword);

  @override
  List<Object> get props => [obscurePassword, obscureConfirmPassword];
}

class ResetPasswordErrorState extends ResetPasswordState {
  final Exception exception;

  @override
  const ResetPasswordErrorState(
      {super.obscurePassword,
      super.obscureConfirmPassword,
      required this.exception});

  @override
  ResetPasswordErrorState copy(
          {bool? obscurePassword,
          bool? obscureConfirmPassword,
          Exception? exception}) =>
      ResetPasswordErrorState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword,
          exception: exception ?? this.exception);

  @override
  List<Object> get props =>
      [exception, obscurePassword, obscureConfirmPassword];
}

class ResetPasswordSuccessState extends ResetPasswordState {
  const ResetPasswordSuccessState(
      {super.obscurePassword, super.obscureConfirmPassword});

  @override
  ResetPasswordSuccessState copy(
          {bool? obscurePassword, bool? obscureConfirmPassword}) =>
      ResetPasswordSuccessState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword);

  @override
  List<Object> get props => [obscurePassword, obscureConfirmPassword];
}
