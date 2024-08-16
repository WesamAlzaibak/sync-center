import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/auth_remote_repository.dart';
import '../models/profile.dart';

@injectable
class GetProfileUseCase {
  GetProfileUseCase({
    required AuthRemoteRepository authRemoteRepository,
  }) : _authRemoteRepository = authRemoteRepository;

  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<Profile>> call() async {
    final result = await _authRemoteRepository.getProfile();
    return result;
  }
}
