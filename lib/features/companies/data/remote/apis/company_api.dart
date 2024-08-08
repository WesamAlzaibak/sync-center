import 'package:injectable/injectable.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';
import '../model/company/company_dto.dart';

@injectable
class CompanyApi {
  final RemoteManager _remoteManager;

  CompanyApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<CompanyDto> getCompany(int companyId) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/company/$companyId",
    );
    final normalResponse = NormalResponse.fromJson(response.data ?? {},
        (data) => CompanyDto.fromJson(data as Map<String, dynamic>));
    return normalResponse.data;
  }
}
