import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/projects/data/remote/mappers/projects_mapper.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/project.dart';

import '../../../../../core/utils/result.dart';
import '../apis/projects_api.dart';

@injectable
class ProjectRemoteRepository {
  final ProjectApi _projectApi;

  ProjectRemoteRepository({required ProjectApi projectApi})
      : _projectApi = projectApi;

  Future<Result<List<Project>>> getMyProjects() async {
    return await asyncRunCatching<List<Project>>(() async {
      final projectsDto = await _projectApi.getMyProjects();
      final projects = projectsDto.toProjects();
      return projects;
    });
  }

  Future<Result<Project>> getProjectDetails(int childId) async {
    return await asyncRunCatching<Project>(() async {
      final projectDto = await _projectApi.getProjectDetails(childId);
      final project = projectDto.toProject();
      return project;
    });
  }
}
