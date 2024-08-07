import 'package:sync_center_mobile/features/files/data/remote/models/project_file/project_file_dto.dart';
import 'package:sync_center_mobile/features/files/domain/entities/project_file.dart';

extension ProjectFileDtoX on ProjectFileDto {
  ProjectFile toProjectFile() => ProjectFile(
    url: url,
    id: id,
    userName: userName,
    userPicture: userPicture,
    date: DateTime.parse(date),
  );
}

extension ProjectFilesListX on List<ProjectFileDto> {
  List<ProjectFile> toProjectFiles() => map((e) => e.toProjectFile()).toList();
}
