import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/entities/company.dart';
import '../model/company/child_dto.dart';

extension CompanyDtoX on CompanyDto {
  Company toCompany() => Company(
        name: name,
        id: id,
        projectsNumber: projectsNumber,
        description: description,
        email: email,
        phoneNumber: phoneNumber,
    employeesNumber: employeesNumber,
        location: location,
        imageUrl: "$ApiRoutes/$imageUrl",
      );
}

extension CompaniesListX on List<CompanyDto> {
  List<Company> toCompanies() => map((e) => e.toCompany()).toList();
}
