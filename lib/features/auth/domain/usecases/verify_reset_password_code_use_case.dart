import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';

@injectable
class VerifyResetPasswordCodeUseCase {
  VerifyResetPasswordCodeUseCase({
    required AuthRemoteRepository authRemoteRepository,
  }) : _authRemoteRepository = authRemoteRepository;

  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<void>> call(
      {required String code, required String email}) async {
    final result = await _authRemoteRepository.verifyResetPasswordCode(
      code: code,
      email: email,
    );
    return result;
  }
}
