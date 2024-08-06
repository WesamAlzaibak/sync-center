import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/features/projects/ui/components/tasks_list_view_component.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../dummy_data.dart';
import '../components/choose_task_type_component.dart';
import '../components/task_bottom_sheet_component.dart';
import '../cubits/tasks/tasks_cubit.dart';
import '../cubits/tasks/tasks_state.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({
    super.key,
    required this.projectName,
    required this.projectId,
  });

  static const route = "/TasksScreen";
  final String projectName;
  final int projectId;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectTasksCubit, ProjectTasksState>(
      listenWhen: (previousState, state) {
        return previousState is! ProjectTasksErrorState &&
            state is ProjectTasksErrorState;
      },
      listener: (BuildContext context, state) {
        if (state is ProjectTasksErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
        }
      },
      child: BlocBuilder<ProjectTasksCubit, ProjectTasksState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100,
              title: Text(
                "$projectName Tasks",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: SyncColors.black,
                ),
              ),
              leadingWidth: 64,
              leading: Row(
                children: [
                  const SizedBox(width: 16),
                  DefaultBackButton(onPressed: () => context.pop()),
                ],
              ),
            ),
            body: RefreshIndicator(
              edgeOffset: 0,
              key: _refreshIndicatorKey,
              color: SyncColors.darkBlue,
              onRefresh: () async {},
              child: SingleChildScrollView(
                child: Skeletonizer(
                  enabled: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Choose the type of tasks you want to review for your project ($projectName) so that you can follow up on the punctual work being done by the executing company and check on the progress of your project.",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: SyncColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 70,
                                ),
                                TasksGridView(
                                  tasks: tasks,
                                  isLoading: false,
                                  type: state.currentType,
                                  onTaskClicked: (id) {
                                    final task = tasks.firstWhere((task) => task.id == id);
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.grey[100],
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return TaskBottomSheetComponent(
                                          task: task,
                                        );
                                      },
                                    );
                                  }
                                ),
                              ],
                            ),
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: ExpansionTile(
                                textColor: SyncColors.black,
                                iconColor: SyncColors.darkBlue,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(
                                  (state.currentType) == TaskType.all
                                      ? "All Project Tasks"
                                      : (state.currentType) == TaskType.toDo
                                          ? "ToDo Tasks"
                                          : (state.currentType) ==
                                                  TaskType.inProgress
                                              ? "InProgress Tasks"
                                              : (state.currentType ==
                                                      TaskType.toReview)
                                                  ? "ToReview Tasks"
                                                  : "Done Tasks",
                                  style: const TextStyle(
                                    color: SyncColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                children: [
                                  ChooseTaskTypeComponent(
                                    onClick: () => context
                                        .read<ProjectTasksCubit>()
                                        .toggleTaskType(taskType: TaskType.all),
                                    title: 'All Project Tasks',
                                    titleColor: SyncColors.black,
                                  ),
                                  ChooseTaskTypeComponent(
                                    onClick: () => context
                                        .read<ProjectTasksCubit>()
                                        .toggleTaskType(
                                            taskType: TaskType.toDo),
                                    title: 'ToDo Tasks',
                                    titleColor: SyncColors.red,
                                  ),
                                  ChooseTaskTypeComponent(
                                    onClick: () => context
                                        .read<ProjectTasksCubit>()
                                        .toggleTaskType(
                                            taskType: TaskType.inProgress),
                                    title: 'InProgress Tasks',
                                    titleColor: SyncColors.lightBlue,
                                  ),
                                  ChooseTaskTypeComponent(
                                    onClick: () => context
                                        .read<ProjectTasksCubit>()
                                        .toggleTaskType(
                                            taskType: TaskType.toReview),
                                    title: 'ToReview Tasks',
                                    titleColor: SyncColors.lightBlue_1,
                                  ),
                                  ChooseTaskTypeComponent(
                                    onClick: () => context
                                        .read<ProjectTasksCubit>()
                                        .toggleTaskType(
                                            taskType: TaskType.done),
                                    title: 'Done Tasks',
                                    titleColor: SyncColors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
