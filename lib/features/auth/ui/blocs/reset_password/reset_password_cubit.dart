import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/ui/blocs/reset_password/reset_password_state.dart';

import '../../../domain/usecases/reset_password_use_case.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(
      {required ResetPasswordUseCase resetPasswordUseCase})
      : _resetPasswordUseCase = resetPasswordUseCase,
        super(const ResetPasswordInitialState());

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(const ResetPasswordLoadingState());
    final result = await _resetPasswordUseCase.call(
      code: code,
      newPassword: newPassword,
      email: email,
    );
    result.fold((error) => emit(ResetPasswordErrorState(exception: error)),
        (data) => emit(const ResetPasswordSuccessState()));
  }

  void toggleObscurePassword() {
    final currentObscurePasswordState = state.obscurePassword;
    emit(state.copy(obscurePassword: !currentObscurePasswordState));
  }

  void toggleObscureConfirmPassword() {
    final currentObscureConfirmPasswordState = state.obscureConfirmPassword;
    emit(state.copy(
        obscureConfirmPassword: !currentObscureConfirmPasswordState));
  }
}
