import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/companies/data/remote/repositories/company_remote_repository.dart';
import 'package:sync_center_mobile/features/companies/domain/entities/company.dart';

import '../../../../core/utils/result.dart';

@injectable
class GetCompanyUseCase {
  GetCompanyUseCase({
    required CompanyRemoteRepository companyRemoteRepository,
  }) : _companyRemoteRepository = companyRemoteRepository;

  final CompanyRemoteRepository _companyRemoteRepository;

  Future<Result<Company>> call(int companyId) async {
    final result = await _companyRemoteRepository.getCompany(companyId);
    return result;
  }
}
