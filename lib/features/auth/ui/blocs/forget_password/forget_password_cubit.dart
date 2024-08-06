import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/request_reset_password_use_case.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final RequestResetPasswordUseCase _requestResetPasswordUseCase;

  ForgetPasswordCubit({required RequestResetPasswordUseCase forgetPasswordUseCase})
      : _requestResetPasswordUseCase = forgetPasswordUseCase,
        super(const ForgetPasswordInitialState());

  Future<void> requestResetPassword({
    required String email,
  }) async {
    emit(const ForgetPasswordLoadingState());
    final result = await _requestResetPasswordUseCase.call(email: email);
    result.fold(
      (error) => emit(ForgetPasswordErrorState(exception: error)),
      (data) => emit(ForgetPasswordSuccessState(email: email)),
    );
  }
}
