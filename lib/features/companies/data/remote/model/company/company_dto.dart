import 'package:json_annotation/json_annotation.dart';

part 'company_dto.g.dart';

@JsonSerializable()
class CompanyDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  // @JsonKey(name: "description")
  // final String description;
  @JsonKey(name: "email")
  final String email;

  //@JsonKey(name: "location")
  // final String location;
  @JsonKey(name: "phone")
  final String phoneNumber;

  @JsonKey(name: "employees_count")
  final int employeesNumber;
  @JsonKey(name: "projects_count",defaultValue: 0)
  final int projectsNumber;
  @JsonKey(name: "logo", defaultValue: "")
  final String logo;

  CompanyDto({
    required this.name,
    required this.id,
    // required this.description,
    required this.email,
    // required this.location,
    required this.phoneNumber,
    required this.logo,
    required this.projectsNumber,
    required this.employeesNumber,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDtoToJson(this);
}
