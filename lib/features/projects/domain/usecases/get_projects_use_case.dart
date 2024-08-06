import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/projects_remote_repository.dart';
import '../entities/project.dart';

@injectable
class GetMyProjectsUseCase {
  GetMyProjectsUseCase({
    required ProjectRemoteRepository projectRemoteRepository,
  }) : _projectRemoteRepository = projectRemoteRepository;

  final ProjectRemoteRepository _projectRemoteRepository;

  Future<Result<List<Project>>> call() async {
    final result = await _projectRemoteRepository.getMyProjects();
    return result;
  }
}