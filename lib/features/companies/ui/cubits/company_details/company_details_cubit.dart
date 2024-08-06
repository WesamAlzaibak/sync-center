import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/get_company_use_case.dart';
import 'company_details_state.dart';

@injectable
class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  final GetCompanyUseCase _getCompanyUseCase;

  CompanyDetailsCubit({
    required GetCompanyUseCase getCompanyUseCase,
  })  : _getCompanyUseCase = getCompanyUseCase,
        super(const CompanyDetailsInitialState());

  Future<void> fetchCompanyDetailsData(int companyId) async {
    emit(const CompanyDetailsLoadingState());
    refreshCompanyDetailsData(companyId);
  }

  Future<void> refreshCompanyDetailsData(int companyId) async {
    emit(const CompanyDetailsLoadingState());
    final result = await _getCompanyUseCase.call(companyId);
    result.fold(
      (error) => emit(CompanyDetailsErrorState(exception: error)),
      (data) {
        emit(CompanyDetailsSuccessState(company: data));
      },
    );
  }
}
