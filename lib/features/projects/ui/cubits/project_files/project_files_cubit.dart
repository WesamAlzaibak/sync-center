
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/files/domain/entities/project_file.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/project_files/project_files_state.dart';

import '../../../../../core/utils/result.dart';
import '../../../../files/data/remote/models/upload_project_file/upload_project_file_dto.dart';
import '../../../../files/domain/usecases/get_project_files_use_case.dart';
import '../../../../files/domain/usecases/upload_project_file_use_case.dart';

@injectable
class ProjectFilesCubit extends Cubit<ProjectFilesState> {
  final GetProjectFilesUseCase _getProjectFilesUseCase;
  final UploadProjectFileUseCase _uploadProjectFileUseCase;

  ProjectFilesCubit({
    required GetProjectFilesUseCase getProjectFilesUseCase,
    required UploadProjectFileUseCase uploadProjectFileUseCase,
  })  : _getProjectFilesUseCase = getProjectFilesUseCase,
  _uploadProjectFileUseCase = uploadProjectFileUseCase,
        super(const ProjectFilesInitialState());

  List<ProjectFile> currentFiles = [];

  Future<void> fetchProjectFilesData(int projectId) async {
    emit(const ProjectFilesLoadingState());
    refreshProjectFilesData(projectId);
  }

  Future<void> refreshProjectFilesData(int projectId) async {
    final results = await Future.wait([
      _getProjectFilesUseCase.call(projectId)
    ]);
    Result.evaluate(results).fold(
          (error) => emit(ProjectFilesErrorState(exception: error)),
          (data) {
        final files = data[0] as List<ProjectFile>;
        currentFiles = files;
        if (files.isEmpty) {
          emit(const NoFilesState());
        }
        else {
          emit(
            ProjectFilesSuccessState(
                files: files,
            ),
          );
        }
      },
    );
  }

  Future<void> uploadProjectFile(FilePickerResult file, int projectId) async {
    if (state is! ProjectFilesSuccessState && state is! NoFilesState) {
      return;
    }
    emit(UploadProjectFileLoadingState(files: currentFiles));

    final uploadDto = await UploadProjectFileDto.fromFilePickerResult(file);
    final result = await _uploadProjectFileUseCase.call(uploadDto, projectId);

    result.fold(
          (error) {
        emit(UploadProjectFileErrorState(exception: error, files: currentFiles));
      },
          (data) => emit(UploadProjectFileSuccessState(files: currentFiles)),
    );
  }
}
