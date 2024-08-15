import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/data/remote/mappers/user_mapper.dart';

import '../../../../core/utils/result.dart';
import '../../../firebase/data/repositories/firebase_repository.dart';
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
    required FirebaseRepository firebaseRepository,
  })  : _authRemoteRepository = authRemoteRepository,
        _authLocalRepository = authLocalRepository,
        _userLocalRepository = userLocalRepository,
  _firebaseRepository = firebaseRepository;

  final AuthRemoteRepository _authRemoteRepository;
  final AuthLocalRepository _authLocalRepository;
  final UserLocalRepository _userLocalRepository;
  final FirebaseRepository _firebaseRepository;

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
        final fcmToken = await FirebaseMessaging.instance.getToken();
        final fcmTokenResult =
        await _firebaseRepository.updateFcmToken(fcmToken: fcmToken ?? "");
        return fcmTokenResult.fold(
              (error) => Result.failure(error),
              (_) async {
            return Result.success(data);
          },
        );
      },
    );
  }
}
