import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/projects_remote_repository.dart';
import '../entities/project.dart';

@injectable
class GetProjectDetailsUseCase {
  GetProjectDetailsUseCase({
    required ProjectRemoteRepository projectRemoteRepository,
  }) : _projectRemoteRepository = projectRemoteRepository;

  final ProjectRemoteRepository _projectRemoteRepository;

  Future<Result<Project>> call({required int id}) async {
    final result = await _projectRemoteRepository.getProjectDetails(id);
    return result;
  }
}

