import 'package:injectable/injectable.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/models/pagination_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';
import '../models/project_file/project_file_dto.dart';

@injectable
class FileApi {
  final RemoteManager _remoteManager;

  FileApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<ProjectFileDto>> getProjectFiles(int projectId) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/files/$projectId",
    );
    final normalResponse = NormalResponse.fromJson(
        response.data ?? {},
            (data) => PaginationResponse.fromJson(data as Map<String, dynamic>,
                (data) => ProjectFileDto.fromJson(data as Map<String, dynamic>)));
    return normalResponse.data.items;
  }

}
