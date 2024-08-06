import 'package:injectable/injectable.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/models/pagination_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';
import '../model/project/project_dto.dart';

@injectable
class ProjectApi {
  final RemoteManager _remoteManager;

  ProjectApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<ProjectDto>> getMyProjects() async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/client/projects",
    );
    final normalResponse = NormalResponse.fromJson(
        response.data ?? {},"projects",
        (data) => PaginationResponse.fromJson(data as Map<String, dynamic>,
            (data) => ProjectDto.fromJson(data as Map<String, dynamic>)));
    return normalResponse.data.items;
  }

  Future<ProjectDto> getProjectDetails(int childId) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/parent/students/$childId",
    );
    final normalResponse = NormalResponse.fromJson(response.data ?? {},"projects",
        (data) => ProjectDto.fromJson(data as Map<String, dynamic>));
    return normalResponse.data;
  }
}
