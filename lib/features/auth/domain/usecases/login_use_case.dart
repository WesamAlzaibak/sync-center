import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/data/remote/mappers/user_mapper.dart';

import '../../../../core/utils/result.dart';
import '../../data/local/repositories/auth_local_repository.dart';
import '../../data/local/repositories/user_local_repository.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';
import '../models/user.dart';

@injectable
class LoginUseCase {
  LoginUseCase({
    required AuthRemoteRepository authRemoteRepository,
    required AuthLocalRepository authLocalRepository,
    required UserLocalRepository userLocalRepository,
  })  : _authRemoteRepository = authRemoteRepository,
        _authLocalRepository = authLocalRepository,
        _userLocalRepository = userLocalRepository;

  final AuthRemoteRepository _authRemoteRepository;
  final AuthLocalRepository _authLocalRepository;
  final UserLocalRepository _userLocalRepository;

  Future<Result<User>> call(
      {required String email, required String password}) async {
    final loginResult = await _authRemoteRepository.login(
        email: email, password: password);
    return loginResult.fold(
      (error) => Result.failure(error),
      (data) async {
        final token = data.token;
        await _authLocalRepository.setToken(token);
        await _authLocalRepository.setLoggedIn();
        await _userLocalRepository.setUser(data.toUserPref());
        return Result.success(data);
      },
    );
  }
}
