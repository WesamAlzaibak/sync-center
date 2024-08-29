import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/tasks/tasks_state.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

import '../../../../../core/utils/result.dart';
import '../../../../tasks/domain/usecases/get_project_tasks_use_case.dart';

@injectable
class ProjectTasksCubit extends Cubit<ProjectTasksState> {
  final GetProjectTasksUseCase _getProjectTasksUseCase;

  ProjectTasksCubit({
    required GetProjectTasksUseCase getProjectTasksUseCase,
  })  : _getProjectTasksUseCase = getProjectTasksUseCase,
        super(
          const ProjectTasksInitialState(
            currentType: TaskType.all,
          ),
        );

  Future<void> fetchProjectTasks({required int projectId}) async {
    emit(
      ProjectTasksLoadingState(
        currentType: state.currentType,
      ),
    );
    refreshProjectTasks(
      projectId: projectId,
    );
  }

  Future<void> refreshProjectTasks({required int projectId}) async {
    final results = await Future.wait([
      _getProjectTasksUseCase.call(projectId: projectId),
    ]);
    Result.evaluate(results).fold(
      (error) => emit(
        ProjectTasksErrorState(
          exception: error,
          currentType: state.currentType,
        ),
      ),
      (data) {
        final tasks = data[0] as List<Task>;
        emit(
          ProjectTasksSuccessState(
            tasks: tasks,
            currentType: state.currentType,
          ),
        );
      },
    );
  }

  void toggleTaskType({required TaskType taskType}) {
    emit(state.copy(currentType: taskType));
  }
}
