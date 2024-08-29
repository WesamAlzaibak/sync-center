import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/user_projects.dart';
import '../../../../../core/utils/result.dart';
import '../../../../projects/domain/usecases/get_projects_use_case.dart';
import '../../../domain/entities/company.dart';
import '../../../domain/usecases/get_company_use_case.dart';
import 'company_details_state.dart';

@injectable
class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  final GetCompanyUseCase _getCompanyUseCase;
  final GetUserProjectsUseCase _getUserProjectsUseCase;

  CompanyDetailsCubit({
    required GetCompanyUseCase getCompanyUseCase,
    required GetUserProjectsUseCase getUserProjectsUseCase,
  })  : _getCompanyUseCase = getCompanyUseCase,
  _getUserProjectsUseCase = getUserProjectsUseCase,
        super(const CompanyDetailsInitialState());

  Future<void> fetchCompanyDetailsData(int companyId) async {
    emit(const CompanyDetailsLoadingState());
    refreshCompanyDetailsData(companyId);
  }

  Future<void> refreshCompanyDetailsData(int companyId) async {
    final results = await Future.wait([
      _getCompanyUseCase.call(companyId),
      _getUserProjectsUseCase.call(),
    ]);
    Result.evaluate(results).fold(
          (error) => emit(CompanyDetailsErrorState(exception: error)),
          (data) {
        final company = data[0] as Company;
        final projects = data[1] as List<UserProjects> ;
        emit(
          CompanyDetailsSuccessState(
            projects: projects,
            company: company,
          ),
        );
      },
    );
  }
}
