import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool obscurePassword;

  const LoginState({this.obscurePassword = true});

  LoginState copy({bool? obscurePassword}) =>
      LoginState(obscurePassword: obscurePassword ?? this.obscurePassword);

  @override
  List<Object?> get props => [obscurePassword];
}

class LoginInitialState extends LoginState {
  const LoginInitialState({super.obscurePassword});

  @override
  LoginInitialState copy({bool? obscurePassword}) => LoginInitialState(
      obscurePassword: obscurePassword ?? this.obscurePassword);

  @override
  List<Object> get props => [obscurePassword];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({super.obscurePassword});

  @override
  LoginLoadingState copy({bool? obscurePassword}) => LoginLoadingState(
      obscurePassword: obscurePassword ?? this.obscurePassword);

  @override
  List<Object> get props => [obscurePassword];
}

class LoginErrorState extends LoginState {
  final Exception exception;

  @override
  const LoginErrorState({super.obscurePassword, required this.exception});

  @override
  LoginErrorState copy({bool? obscurePassword, Exception? exception}) =>
      LoginErrorState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception, obscurePassword];
}

class LoginSuccessState extends LoginState {

  const LoginSuccessState(
      {super.obscurePassword});

  @override
  LoginSuccessState copy({
    bool? obscurePassword}) =>
      LoginSuccessState(
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );

  @override
  List<Object> get props => [obscurePassword];
}
