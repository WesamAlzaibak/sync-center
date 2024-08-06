import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/entities/project.dart';
import '../model/project/project_dto.dart';

extension ProjectDtoX on ProjectDto {
  Project toProject() => Project(
        title: title,
        id: id,
        companyName: companyName,
        companyPicture: companyPicture,
        description: description,
        projectLogo: "$ApiRoutes/$projectLogo",
      );
}

extension ProjectsListX on List<ProjectDto> {
  List<Project> toProjects() => map((e) => e.toProject()).toList();
}
