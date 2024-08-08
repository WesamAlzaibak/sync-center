import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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

  // Future<void> uploadProjectFile({required UploadProjectFileDto uploadProjectFileDto,required int projectId}) async {
  //   final response = await _remoteManager.request<Map<String, dynamic>>(
  //     RequestMethod.post,
  //     "/user/files/project/$projectId",
  //     body: uploadProjectFileDto,
  //   );
  // }


  // Future<void> uploadProjectFile(FilePickerResult file, int childId) async {
  //   List<String?> files = [];
  //   for(int i=0;i<file.files.length;i++){
  //     files.add(lookupMimeType(file.files[i].path!)?.split("/").first ?? "");
  //   }
  //   final formData = [];
  //   for(int i=0;i<files.length;i++){
  //     final type = files[i]?.split("/").first ?? "";
  //     final subtype = files[i]?.split("/").last ?? "";
  //
  //       formData.add(MultipartFile.fromFile(file.files[i].path!,
  //           filename: file.files[i].name, contentType: MediaType(type, subtype)),
  //     );
  //   }
  //   await _remoteManager.request<Map<String, dynamic>>(
  //     RequestMethod.post,
  //     "/parent/students/update-avatar/$childId",
  //     body: {"file":formData},
  //   );
  // }

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
