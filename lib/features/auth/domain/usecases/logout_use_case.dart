import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/local/repositories/auth_local_repository.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';

@injectable
class LogoutUseCase {
  LogoutUseCase({
    required AuthLocalRepository authLocalRepository,
    required AuthRemoteRepository authRemoteRepository,
  })  : _authLocalRepository = authLocalRepository,_authRemoteRepository = authRemoteRepository;

  final AuthLocalRepository _authLocalRepository;
  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<void>> call() async {
    final result = asyncRunCatching(
          () async {
        final logoutResult = await _authRemoteRepository.logout();
        return logoutResult.fold(
              (error) => Result.failure(error),
              (data) async {
            await _authLocalRepository.setLoggedOut();
          },
        );
      },
    );
    return result;
  }
}
