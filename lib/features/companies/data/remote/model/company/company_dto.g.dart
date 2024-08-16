// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDto _$CompanyDtoFromJson(Map<String, dynamic> json) => CompanyDto(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      // description: json["description"] as String,
      email: json["email"] as String,
      phoneNumber: json["phone"] as String,
      logo: json['logo'] as String,
      projectsNumber: (json["projects_count"]==null)?0:(json['projects_count'] as num).toInt(),
      employeesNumber:
      (json['employees_count'] as num).toInt(),
    );

Map<String, dynamic> _$CompanyDtoToJson(CompanyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      //'description': instance.description,
      'email': instance.email,
      'phone': instance.phoneNumber,
      'employees_count': instance.employeesNumber,
      'projects_count': instance.projectsNumber,
      'logo': instance.logo,
    };
