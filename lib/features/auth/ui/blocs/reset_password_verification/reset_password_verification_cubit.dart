import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/ui/blocs/reset_password_verification/reset_password_verification_state.dart';

import '../../../domain/usecases/resend_reset_password_code_use_case.dart';
import '../../../domain/usecases/verify_reset_password_code_use_case.dart';

@injectable
class ResetPasswordVerificationCubit
    extends Cubit<ResetPasswordVerificationState> {
  final VerifyResetPasswordCodeUseCase _verifyResetPasswordCodeUseCase;
  final ResendResetPasswordCodeUseCase _resendResetPasswordCodeUseCase;

  ResetPasswordVerificationCubit({
    required VerifyResetPasswordCodeUseCase verifyResetPasswordCodeUseCase,
    required ResendResetPasswordCodeUseCase resendResetPasswordCodeUseCase,
  })  : _verifyResetPasswordCodeUseCase = verifyResetPasswordCodeUseCase,
        _resendResetPasswordCodeUseCase = resendResetPasswordCodeUseCase,
        super(const ResetPasswordVerificationInitialState());

  Future<void> verify({
    required String email,
    required String code,
  }) async {
    emit(
      ResetPasswordVerificationLoadingState(
        verifyButtonEnabled: state.verifyButtonEnabled,
      ),
    );
    final result = await _verifyResetPasswordCodeUseCase.call(
      code: code,
      email: email,
    );
    result.fold(
      (error) => emit(
        ResetPasswordVerificationErrorState(
          exception: error,
          verifyButtonEnabled: state.verifyButtonEnabled,
        ),
      ),
      (data) => emit(
        ResetPasswordVerificationSuccessState(
          code: code,
          verifyButtonEnabled: state.verifyButtonEnabled,
          email: email,
        ),
      ),
    );
  }

  Future<void> resend({required String email}) async {
    emit(
      ResetPasswordVerificationLoadingState(
        verifyButtonEnabled: state.verifyButtonEnabled,
      ),
    );
    final result = await _resendResetPasswordCodeUseCase.call(
      email: email,
    );
    result.fold(
      (error) => emit(
        ResetPasswordVerificationErrorState(
          exception: error,
          verifyButtonEnabled: state.verifyButtonEnabled,
        ),
      ),
      (data) => emit(
        ResendResetPasswordCodeSuccessState(
          verifyButtonEnabled: state.verifyButtonEnabled,
        ),
      ),
    );
  }

  void toggleVerifyButtonState(bool enabled) {
    emit(state.copy(verifyButtonEnabled: enabled));
  }
}
