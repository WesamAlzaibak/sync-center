import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/entities/company.dart';
import '../model/company/company_dto.dart';

extension CompanyDtoX on CompanyDto {
  Company toCompany() => Company(
        name: name,
        id: id,
        projectsNumber: projectsNumber,
        description: description,
        email: email,
        phoneNumber: phoneNumber,
        employeesNumber: employeesNumber,
        logo: logo.isEmpty
            ? ""
            : logo.replaceAll("http://192.168.146.1:8000", ApiRoutes.devApi),
      );
}

extension CompaniesListX on List<CompanyDto> {
  List<Company> toCompanies() => map((e) => e.toCompany()).toList();
}
