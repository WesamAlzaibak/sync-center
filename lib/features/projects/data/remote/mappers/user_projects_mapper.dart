import '../../../domain/entities/user_projects.dart';
import '../model/user_projects/user_projects_dto.dart';

extension UserProjectsDtoX on UserProjectsDto {
  UserProjects toUserProjects() => UserProjects(
    name: name,
    id: id,
    createdDate: DateTime.parse(createdDate),
    logo: logo.replaceAll("http://192.168.146.1:8000", "http://192.168.1.8:8000"),
  );
}

extension UserProjectsListX on List<UserProjectsDto> {
  List<UserProjects> toUserProjectsList() => map((e) => e.toUserProjects()).toList();
}
