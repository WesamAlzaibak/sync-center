import 'package:equatable/equatable.dart';

class ResetPasswordVerificationState extends Equatable {
  final bool verifyButtonEnabled;

  const ResetPasswordVerificationState({
    this.verifyButtonEnabled = false,
  });

  ResetPasswordVerificationState copy({bool? verifyButtonEnabled}) =>
      ResetPasswordVerificationState(
        verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
      );

  @override
  List<Object?> get props => [verifyButtonEnabled];
}

class ResetPasswordVerificationInitialState
    extends ResetPasswordVerificationState {
  const ResetPasswordVerificationInitialState({
    super.verifyButtonEnabled,
  });

  @override
  ResetPasswordVerificationInitialState copy({
    bool? verifyButtonEnabled,
  }) =>
      ResetPasswordVerificationInitialState(
        verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
      );

  @override
  List<Object> get props => [verifyButtonEnabled];
}

class ResetPasswordVerificationLoadingState
    extends ResetPasswordVerificationState {
  const ResetPasswordVerificationLoadingState({super.verifyButtonEnabled});

  @override
  ResetPasswordVerificationLoadingState copy({
    bool? verifyButtonEnabled,
  }) =>
      ResetPasswordVerificationLoadingState(
        verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
      );

  @override
  List<Object> get props => [verifyButtonEnabled];
}

class ResetPasswordVerificationErrorState
    extends ResetPasswordVerificationState {
  final Exception exception;

  @override
  const ResetPasswordVerificationErrorState(
      {super.verifyButtonEnabled, required this.exception});

  @override
  ResetPasswordVerificationErrorState copy({
    bool? verifyButtonEnabled,
    Exception? exception,
  }) =>
      ResetPasswordVerificationErrorState(
          verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
          exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception, verifyButtonEnabled];
}

class ResetPasswordVerificationSuccessState
    extends ResetPasswordVerificationState {
  final String code;
  final String email;

  const ResetPasswordVerificationSuccessState({
    required this.code,
    required this.email,
    super.verifyButtonEnabled,
  });

  @override
  ResetPasswordVerificationSuccessState copy(
          {bool? verifyButtonEnabled, String? code, String? phoneNumber}) =>
      ResetPasswordVerificationSuccessState(
          verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
          code: code ?? this.code,
          email: email);

  @override
  List<Object> get props => [verifyButtonEnabled, code, email];
}

class ResendResetPasswordCodeSuccessState
    extends ResetPasswordVerificationState {
  const ResendResetPasswordCodeSuccessState({super.verifyButtonEnabled});

  @override
  ResendResetPasswordCodeSuccessState copy({bool? verifyButtonEnabled}) =>
      ResendResetPasswordCodeSuccessState(
        verifyButtonEnabled: verifyButtonEnabled ?? this.verifyButtonEnabled,
      );

  @override
  List<Object> get props => [verifyButtonEnabled];
}
