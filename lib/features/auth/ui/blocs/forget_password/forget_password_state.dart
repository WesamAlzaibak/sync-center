import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  ForgetPasswordState copy() => const ForgetPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitialState extends ForgetPasswordState {
  const ForgetPasswordInitialState();

  @override
  ForgetPasswordInitialState copy() => const ForgetPasswordInitialState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();

  @override
  ForgetPasswordLoadingState copy() => const ForgetPasswordLoadingState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final Exception exception;

  @override
  const ForgetPasswordErrorState({required this.exception});

  @override
  ForgetPasswordErrorState copy({Exception? exception}) =>
      ForgetPasswordErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String email;

  const ForgetPasswordSuccessState({required this.email});

  @override
  ForgetPasswordSuccessState copy({String? email}) =>
      ForgetPasswordSuccessState(email: email ?? this.email);

  @override
  List<Object> get props => [email];
}
