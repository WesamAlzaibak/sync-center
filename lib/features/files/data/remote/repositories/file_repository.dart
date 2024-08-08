import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/files/data/remote/mappers/project_file_mapper.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/entities/project_file.dart';
import '../apis/file_api.dart';
import '../models/upload_project_file/upload_project_file_dto.dart';

@injectable
class FileRemoteRepository {
  final FileApi _fileApi;

  FileRemoteRepository({required FileApi fileApi})
      : _fileApi = fileApi;

  Future<Result<List<ProjectFile>>> getProjectFiles(int projectId) async {
    return await asyncRunCatching<List<ProjectFile>>(() async {
      final projectFilesDto = await _fileApi.getProjectFiles(projectId);
      final projectFiles = projectFilesDto.toProjectFiles();
      return projectFiles;
    });
  }


  Future<Result<void>> uploadProjectFile({
    required UploadProjectFileDto uploadProjectFileDto,
    required int projectId,
  }) async {
    final formData = FormData.fromMap(uploadProjectFileDto.toJson());
    return await asyncRunCatching<void>(() async {
      return await _fileApi.uploadProjectFile(formData:formData,projectId: projectId);
    });
  }

}