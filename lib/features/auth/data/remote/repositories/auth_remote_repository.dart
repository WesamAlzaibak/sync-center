import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/data/remote/mappers/profile_mapper.dart';
import 'package:sync_center_mobile/features/auth/data/remote/mappers/user_mapper.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/models/profile.dart';
import '../../../domain/models/user.dart';
import '../apis/auth_api.dart';
import '../models/forget_password/forget_password_credentials_dto.dart';
import '../models/login/login_credentials/login_credentials_dto.dart';
import '../models/reset_password/resend_reset_password_code_dto.dart';
import '../models/reset_password/reset_password_credentials_dto.dart';
import '../models/reset_password/verify_reset_password_code_dto.dart';

@injectable
class AuthRemoteRepository {
  final AuthApi _authApi;

  AuthRemoteRepository({required AuthApi authApi}) : _authApi = authApi;

  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    final loginRequestDto = LoginCredentialsDto(
      email: email,
      password: password,
    );
    return await asyncRunCatching<User>(() async {
      final userSystemEntries =
          await _authApi.login(userCredentialsDto: loginRequestDto);
      return userSystemEntries.toUser();
    });
  }

  Future<Result<void>> resetPassword(
      {required String code,
      required String email,
      required String newPassword}) async {
    final resetPasswordRequestDto = ResetPasswordCredentialsDto(
      code: code,
      newPassword: newPassword,
      email: email,
      confirmNewPassword: newPassword,
    );
    return await asyncRunCatching<void>(() async {
      return await _authApi.resetPassword(
        resetPasswordCredentialsDto: resetPasswordRequestDto,
      );
    });
  }

  Future<Result<void>> resendResetPasswordCode({required String email}) async {
    final resendResetPasswordCodeDto = ResendResetPasswordCodeDto(email: email);
    return await asyncRunCatching<void>(() async {
      return await _authApi.resendResetPasswordCode(
          resendResetPasswordCodeDto: resendResetPasswordCodeDto);
    });
  }

  Future<Result<void>> verifyResetPasswordCode(
      {required String code, required String email}) async {
    final verifyResetPasswordCodeDto = VerifyResetPasswordCodeDto(
      code: code,
      email: email,
    );
    return await asyncRunCatching<void>(() async {
      return await _authApi.verifyResetPasswordCode(
          verifyResetPasswordCodeDto: verifyResetPasswordCodeDto);
    });
  }

  Future<Result<void>> requestResetPassword({required String email}) async {
    final forgetPasswordRequestDto = ForgetPasswordCredentialsDto(email: email);
    return await asyncRunCatching<void>(() async {
      return await _authApi.requestResetPassword(
        forgetPasswordCredentialsDto: forgetPasswordRequestDto,
      );
    });
  }

  Future<Result<Profile>> getProfile() async {
    return await asyncRunCatching<Profile>(() async {
      final profileDto = await _authApi.getProfile();
      final profile = profileDto.toProfile();
      return profile;
    });
  }

  Future<Result<void>> updateProfileImage(XFile file) async {
    return await asyncRunCatching<void>(() async {
      return await _authApi.updateProfileImage(file);
    });
  }
}
