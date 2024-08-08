import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/files/data/remote/repositories/file_repository.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/models/upload_project_file/upload_project_file_dto.dart';

@injectable
class UploadProjectFileUseCase {
  UploadProjectFileUseCase({
    required FileRemoteRepository fileRemoteRepository,
  }) : _fileRemoteRepository = fileRemoteRepository;

  final FileRemoteRepository _fileRemoteRepository;

  Future<Result<void>> call(
      UploadProjectFileDto uploadProjectFileDto, int projectId) async {
    final result = await _fileRemoteRepository.uploadProjectFile(
        uploadProjectFileDto: uploadProjectFileDto, projectId: projectId);
    return result;
  }
}
