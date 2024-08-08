import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/projects/data/remote/model/user_projects/user_projects_dto.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';
import '../model/project/project_dto.dart';

@injectable
class ProjectApi {
  final RemoteManager _remoteManager;

  ProjectApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<UserProjectsDto>> getMyProjects() async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/projects",
    );
    final normalResponse = NormalResponse.fromJson(
      response.data ?? {},
          (data) => (data as List<dynamic>)
          .map((item) => UserProjectsDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return normalResponse.data;
  }

  Future<ProjectDto> getProjectDetails(int projectId) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/projects/$projectId",
    );
    final normalResponse = NormalResponse.fromJson(response.data ?? {},
        (data) => ProjectDto.fromJson(data as Map<String, dynamic>));
    return normalResponse.data;
  }
}
