import 'package:json_annotation/json_annotation.dart';

part 'child_dto.g.dart';

@JsonSerializable()
class CompanyDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "location")
  final String location;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "employeesNumber")
  final int employeesNumber;
  @JsonKey(name: "projectsNumber")
  final int projectsNumber;
  @JsonKey(
      name: "avatarFileUrl",
      defaultValue:
          "https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg")
  final String imageUrl;

  CompanyDto(
      {required this.name,
      required this.id,
      required this.description,
      required this.email,
      required this.location,
      required this.phoneNumber,
      required this.imageUrl,
      required this.projectsNumber,
      required this.employeesNumber,});

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDtoToJson(this);
}
