import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/data/remote/repositories/auth_remote_repository.dart';

import '../../../../core/utils/result.dart';

@injectable
class UpdateProfileImageUseCase {
  UpdateProfileImageUseCase({
    required AuthRemoteRepository authRemoteRepository,
  }) : _authRemoteRepository = authRemoteRepository;

  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<void>> call(XFile file) async {
    final result =
    await _authRemoteRepository.updateProfileImage(file);
    return result;
  }
}
