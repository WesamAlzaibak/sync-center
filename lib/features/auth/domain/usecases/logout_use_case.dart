import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/local/repositories/auth_local_repository.dart';

@injectable
class LogoutUseCase {
  LogoutUseCase({
    required AuthLocalRepository authLocalRepository,
  }) : _authLocalRepository = authLocalRepository;

  final AuthLocalRepository _authLocalRepository;

  Future<Result<void>> call() async {
    final result = asyncRunCatching(
      () async {
        await _authLocalRepository.setLoggedOut();
      },
    );
    return result;
  }
}
