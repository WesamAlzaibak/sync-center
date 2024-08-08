import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/features/projects/ui/components/files_list_view_component.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/project_files/project_files_cubit.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/project_files/project_files_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';

class ProjectFilesScreen extends StatelessWidget {
  ProjectFilesScreen(
      {super.key, required this.projectName, required this.projectId});

  static const route = "/ProjectFilesScreen";

  final String projectName;
  final int projectId;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<FilePickerResult?> openFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProjectFilesCubit, ProjectFilesState>(
          listenWhen: (previousState, state) {
            return previousState is! ProjectFilesErrorState &&
                state is ProjectFilesErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is ProjectFilesErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ProjectFilesCubit, ProjectFilesState>(
          listenWhen: (previousState, state) {
            return previousState is! UploadProjectFileErrorState &&
                state is UploadProjectFileErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is UploadProjectFileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ProjectFilesCubit, ProjectFilesState>(
          listenWhen: (previousState, state) {
            return previousState is! UploadProjectFileSuccessState &&
                state is UploadProjectFileSuccessState;
          },
          listener: (BuildContext context, state) {
            if (state is UploadProjectFileSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: "Files Added Successfully"));
              _refreshIndicatorKey.currentState!.show();
            }
          },
        ),
        BlocListener<ProjectFilesCubit, ProjectFilesState>(
          listenWhen: (previousState, state) {
            return previousState is! UploadProjectFileLoadingState &&
                state is UploadProjectFileLoadingState ;
          },
          listener: (context, state) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: SyncColors.darkBlue,
                    strokeCap: StrokeCap.round,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<ProjectFilesCubit, ProjectFilesState>(
          listenWhen: (previousState, state) {
            return previousState is UploadProjectFileLoadingState &&
                state is ProjectFilesSuccessState ;
          },
          listener: (context, state) {
            context.pop();
          },
        )
      ],
      child: BlocBuilder<ProjectFilesCubit, ProjectFilesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100,
              title: Text(
                "$projectName Files",
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
              onRefresh: () => context
                  .read<ProjectFilesCubit>()
                  .fetchProjectFilesData(projectId),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer(
                        enabled: state is ProjectFilesLoadingState,
                        child: Text(
                          "This is The files of $projectName Project \n you can follow files that reflect indicators of the progress of your project, special designs, and important files in it",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: SyncColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FilesListViewComponent(
                        projectFile: state is ProjectFilesSuccessState
                            ? state.files
                            : [],
                        isLoading: state is ProjectFilesLoadingState,
                        onFileClick: (String url) => _launchInBrowser(url),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await openFile(); // User picks files
                if (result != null) {
                  await context
                      .read<ProjectFilesCubit>()
                      .uploadProjectFile(result, projectId);
                }
              },
              child: Skeletonizer(
                enabled: state is ProjectFilesLoadingState,
                child: const Icon(
                  Icons.file_upload,
                  color: SyncColors.darkBlue,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
