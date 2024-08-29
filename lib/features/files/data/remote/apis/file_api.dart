import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/files/data/remote/models/upload_project_file/upload_project_file_dto.dart';

import '../../../../../core/data/models/normal_response.dart';
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
      "/user/files/project/$projectId",
    );
    final normalResponse = NormalResponse.fromJson(
      response.data ?? {},
      (data) => (data as List<dynamic>)
          .map((item) => ProjectFileDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return normalResponse.data;
  }

  Future<void> uploadProjectFile({
    required FormData formData,
    required int projectId,
  }) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/files/project/$projectId",
      body: formData,
    );
  }
}
