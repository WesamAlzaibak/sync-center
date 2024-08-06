import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/companies/data/remote/mappers/companies_mapper.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/entities/company.dart';
import '../apis/company_api.dart';

@injectable
class CompanyRemoteRepository {
  final CompanyApi _companyApi;

  CompanyRemoteRepository({required CompanyApi companyApi})
      : _companyApi = companyApi;

  Future<Result<Company>> getCompany(int companyId) async {
    return await asyncRunCatching<Company>(() async {
      final companyDto = await _companyApi.getCompany(companyId);
      final company = companyDto.toCompany();
      return company;
    });
  }
}
