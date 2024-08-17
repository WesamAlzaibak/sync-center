import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/features/projects/ui/components/tasks_list_view_component.dart';
import 'package:sync_center_mobile/features/tasks/domain/enums/task_type.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../tasks/domain/entities/task.dart';
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
              //to do here
              onRefresh: () async {},
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeletonizer(
                      enabled: state is ProjectTasksLoadingState,
                      child: Padding(
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
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Column(
                            children: [
                              TasksGridView(
                                  tasks: state is ProjectTasksSuccessState
                                      ? state.tasks
                                      : [],
                                  isLoading: state is ProjectTasksLoadingState,
                                  onTaskClicked: (id) {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.grey[100],
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return TaskBottomSheetComponent(
                                          task: (state is ProjectTasksSuccessState)
                                              ?state.tasks.firstWhere((
                                              task) => task.id == id):  const Task(title: '',
                                              type: TaskType.all,
                                              description: '',
                                              id: -1,
                                              startDate: '',
                                              endDate: '',
                                              employees: [],
                                              totalDuration: '')
                                        );
                                      },
                                    );
                                  }
                              ),
                            ],
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
          );
        },
      ),
    );
  }
}
