import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordUseCase({
    required AuthRemoteRepository authRemoteRepository,
  }) : _authRemoteRepository = authRemoteRepository;

  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<void>> call({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    return await _authRemoteRepository.resetPassword(
      code: code,
      newPassword: newPassword,
        email: email
    );
  }
}
