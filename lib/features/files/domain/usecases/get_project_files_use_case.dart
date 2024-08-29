import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/files/data/remote/repositories/file_repository.dart';

import '../../../../core/utils/result.dart';
import '../entities/project_file.dart';

@injectable
class GetProjectFilesUseCase {
  GetProjectFilesUseCase({
    required FileRemoteRepository fileRemoteRepository,
  }) : _fileRemoteRepository = fileRemoteRepository;

  final FileRemoteRepository _fileRemoteRepository;

  Future<Result<List<ProjectFile>>> call(int projectId) async {
    final result = await _fileRemoteRepository.getProjectFiles(projectId);
    return result;
  }
}