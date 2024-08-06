import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';

@injectable
class RequestResetPasswordUseCase {
  RequestResetPasswordUseCase({
    required AuthRemoteRepository authRemoteRepository,
  }) : _authRemoteRepository = authRemoteRepository;

  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<void>> call({required String email}) async {
    final forgetPasswordUseCaseResult =
    await _authRemoteRepository.requestResetPassword(email: email);
    return forgetPasswordUseCaseResult;
  }
}
