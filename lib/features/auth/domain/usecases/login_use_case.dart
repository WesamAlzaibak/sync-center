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
    print("begin of userCase");
    final loginResult = await _authRemoteRepository.login(
        email: email, password: password);
    return loginResult.fold(
      (error) => Result.failure(error),
      (data) async {
        print("1");
        final token = data.token;
        print("2");
        await _authLocalRepository.setToken(token);
        await _authLocalRepository.setLoggedIn();
        print("3");
        await _userLocalRepository.setUser(data.toUserPref());
        print("4");
        return Result.success(data);
      },
    );
  }
}
