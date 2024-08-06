import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/projects/ui/screens/tasks_screen.dart';
import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../dummy_data.dart';
import '../components/files_folders_count_component.dart';
import '../components/project_base_information_component.dart';
import '../components/project_description_component.dart';
import '../components/tasks_component.dart';
import '../cubits/project_details/project_details_cubit.dart';
import '../cubits/project_details/project_details_state.dart';

class ProjectDetailsScreen extends StatelessWidget {
  ProjectDetailsScreen({
    super.key,
    required this.projectId,
  });

  static const route = "/ProjectDetailsScreen";
  final int projectId;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectDetailsCubit, ProjectDetailsState>(
      listenWhen: (previousState, state) {
        return previousState is! ProjectDetailsErrorState &&
            state is ProjectDetailsErrorState;
      },
      listener: (BuildContext context, state) {
        if (state is ProjectDetailsErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          edgeOffset: 32,
          color: SyncColors.darkBlue,
          onRefresh: () => context
              .read<ProjectDetailsCubit>()
              .fetchProjectDetails(projectId: projectId),
          child: BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
            builder: (context, state) {
              if (state is ProjectDetailsSuccessState) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProjectBaseInformationComponent(
                        onBackClick: () => context.pop(),
                        project: projectList[0],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TasksComponent(
                              toDo: 85,     doing: 24,
                              done: 33,     reviewing: 13,
                              onClick: () => context.push(TasksScreen.route),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const FoldersFilesCountComponent(
                              files: 16,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ProjectDescriptionComponent(
                              description: projectList[0].description,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Stack(
                  children: [
                    const Center(
                      child: CircularProgressIndicator(
                        color: SyncColors.darkBlue,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 56),
                      child: DefaultBackButton(
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
