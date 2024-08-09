import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/tasks/data/remote/mappers/task_mapper.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/entities/task.dart';
import '../api/tasks_api.dart';

@injectable
class TasksRemoteRepository {
  final TasksApi _tasksApi;

  TasksRemoteRepository({required TasksApi tasksApi}) : _tasksApi = tasksApi;

  Future<Result<List<Task>>> getProjectTasks({required int projectId}) async {
    return await asyncRunCatching<List<Task>>(() async {
      final tasksDto = await _tasksApi.getProjectTasks(projectId: projectId);
      final projects = tasksDto.toTasks();
      return projects;
    });
  }
}
