import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/project_details/project_details_state.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/entities/project.dart';
import '../../../domain/usecases/get_project_details_use_case.dart';


@injectable
class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  final GetProjectDetailsUseCase _getProjectDetailsUseCase;

  ProjectDetailsCubit({
    required GetProjectDetailsUseCase getProjectDetailsUseCase,
  })  : _getProjectDetailsUseCase = getProjectDetailsUseCase,
        super(const ProjectDetailsInitialState());

  Future<void> fetchProjectDetails({required int projectId}) async {
    emit(const ProjectDetailsLoadingState());
    refreshProjectDetails(projectId);
  }

  Future<void> refreshProjectDetails(int projectId) async {
    final results = await Future.wait([
      _getProjectDetailsUseCase.call(id: projectId),
    ]);
    Result.evaluate(results).fold(
          (error) => emit(ProjectDetailsErrorState(exception: error)),
          (data) {
        final project = data[0] as Project;
        emit(
          ProjectDetailsSuccessState(
            project: project,
          ),
        );
      },
    );
  }
}
