import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/entities/project.dart';
import '../model/project/project_dto.dart';

extension ProjectDtoX on ProjectDto {
  Project toProject() => Project(
        name: name,
        id: id,
        todoCount: todoCount,
        inProgressCount: inProgressCount,
        toReviewCount: toReviewCount,
        doneCount: doneCount,
        filesCount: filesCount,
        createdDate: DateTime.parse(createdDate),
        logo: logo.replaceAll(
            "http://192.168.146.1:8000", ApiRoutes.devApi),
        description: description,
      );
}

extension ProjectsListX on List<ProjectDto> {
  List<Project> toProjects() => map((e) => e.toProject()).toList();
}
