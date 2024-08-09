import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/tasks/data/remote/models/task/task_dto.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';

@injectable
class TasksApi {
  final RemoteManager _remoteManager;

  TasksApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<TaskDto>> getProjectTasks({
    required int projectId,
  }) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
        RequestMethod.get,
        "/user/tasks/$projectId",
        );
    final normalResponse = NormalResponse.fromJson(
      response.data ?? {},
          (data) => (data as List<dynamic>)
          .map((item) => TaskDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return normalResponse.data;
  }
}
