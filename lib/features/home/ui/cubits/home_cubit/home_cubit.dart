
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/auth/data/local/repositories/user_local_repository.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/project.dart';

import '../../../../../core/utils/result.dart';
import '../../../../projects/domain/usecases/get_projects_use_case.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMyProjectsUseCase _getMyProjectsUseCase;
  final UserLocalRepository _userLocalRepository;

  HomeCubit({
    required GetMyProjectsUseCase getMyProjectsUseCase,
    required UserLocalRepository userLocalRepository,
  })  : _getMyProjectsUseCase = getMyProjectsUseCase,
  _userLocalRepository = userLocalRepository,
        super(const HomeInitialState(""));

  void init() {
    final username = _userLocalRepository.getUser().name;
    emit(HomeInitialState(username));
  }

  Future<void> fetchHomeData() async {
    emit(HomeLoadingState(state.username));
    refreshHomeData();
  }

  Future<void> refreshHomeData() async {
    final results = await Future.wait([
      _getMyProjectsUseCase.call()
    ]);
    Result.evaluate(results).fold(
          (error) => emit(HomeErrorState(exception: error,state.username)),
          (data) {
        final projects = data[0] as List<Project>;
        if (projects.isEmpty) {
          emit(NoProjectState(state.username));
        }
        else {
          emit(
            HomeSuccessState(
              projects: projects,
              state.username
            ),
          );
        }
      },
    );
  }
}
