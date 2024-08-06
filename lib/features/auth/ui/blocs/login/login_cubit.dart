import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginInitialState());

  Future<void> login(
      {required String email, required String password}) async {
    emit(const LoginLoadingState());
    final result =
        await _loginUseCase.call(email: email, password: password);
    result.fold((error) {
      print("wesaaaaaaaaaam");
      emit(LoginErrorState(exception: error));}, (data) {
      print("helooooooooooooooooooooooooo");
      emit(
        const LoginSuccessState(),
      );
    },
    );
  }

  void toggleObscurePassword() {
    final currentObscurePasswordState = state.obscurePassword;
    emit(state.copy(obscurePassword: !currentObscurePasswordState));
  }
}
