import 'package:injectable/injectable.dart';

import '../../../../../core/data/remote/remote_manager.dart';
import '../models/forget_password/forget_password_credentials_dto.dart';
import '../models/login/login_credentials/login_credentials_dto.dart';
import '../models/reset_password/resend_reset_password_code_dto.dart';
import '../models/reset_password/reset_password_credentials_dto.dart';
import '../models/reset_password/verify_reset_password_code_dto.dart';
import '../models/user/user_system_entries_dto.dart';

@injectable
class AuthApi {
  final RemoteManager _remoteManager;

  AuthApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<UserSystemEntriesDto> login({
    required LoginCredentialsDto userCredentialsDto,
  }) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/login",
      body: userCredentialsDto,
    );
    if(response.data!["success"]) {
      final normalResponse = UserSystemEntriesDto.fromJson(response.data!);
      return normalResponse;
    }
    else{
      return response.data!["message"]["email"][0];
    }
  }

  Future<void> resetPassword(
      {required ResetPasswordCredentialsDto
          resetPasswordCredentialsDto}) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/edit-password",
      body: resetPasswordCredentialsDto,
    );
  }

  Future<void> resendResetPasswordCode(
      {required ResendResetPasswordCodeDto resendResetPasswordCodeDto}) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/auth/forgot-password",
      body: resendResetPasswordCodeDto,
    );
  }

  Future<void> verifyResetPasswordCode(
      {required VerifyResetPasswordCodeDto verifyResetPasswordCodeDto}) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/check-code",
      body: verifyResetPasswordCodeDto,
    );
  }

  Future<void> requestResetPassword({
    required ForgetPasswordCredentialsDto forgetPasswordCredentialsDto,
  }) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/reset-password",
      body: forgetPasswordCredentialsDto,
    );
  }

}
