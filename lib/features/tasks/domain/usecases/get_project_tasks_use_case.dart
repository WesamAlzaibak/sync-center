import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/tasks_repository.dart';
import '../entities/task.dart';

@injectable
class GetProjectTasksUseCase {
  GetProjectTasksUseCase({
    required TasksRemoteRepository tasksRemoteRepository,
  }) : _tasksRemoteRepository = tasksRemoteRepository;

  final TasksRemoteRepository _tasksRemoteRepository;

  Future<Result<List<Task>>> call(
      {required int projectId}) async {
    final result = await _tasksRemoteRepository.getProjectTasks(
        projectId: projectId);
    return result;
  }
}
