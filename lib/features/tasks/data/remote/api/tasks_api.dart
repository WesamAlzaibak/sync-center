import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/tasks/data/remote/models/task/task_dto.dart';
import 'package:sync_center_mobile/features/tasks/data/remote/models/tasks_request/tasks_request_dto.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/models/pagination_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';

@injectable
class TasksApi {
  final RemoteManager _remoteManager;

  TasksApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<TaskDto>> getProjectTasks({
    required TasksRequestDto tasksRequestDto,
  }) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
        RequestMethod.get, "/project/tasks",
        body: tasksRequestDto);
    final normalResponse = NormalResponse.fromJson(
        response.data ?? {},
        (data) => PaginationResponse.fromJson(data as Map<String, dynamic>,
            (data) => TaskDto.fromJson(data as Map<String, dynamic>)));
    return normalResponse.data.items;
  }
}
