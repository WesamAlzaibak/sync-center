// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDto _$CompanyDtoFromJson(Map<String, dynamic> json) => CompanyDto(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      description: json["description"] as String,
      location: json["location"] as String,
      email: json["email"] as String,
      phoneNumber: json["phoneNumber"] as String,
      imageUrl: json['avatarFileUrl'] as String? ??
          'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
      projectsNumber: (json['projectsNumber'] as num).toInt(),
      employeesNumber:
      (json['employeesNumber'] as num).toInt(),
    );

Map<String, dynamic> _$CompanyDtoToJson(CompanyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'email': instance.email,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'employeesNumber': instance.employeesNumber,
      'projectsNumber': instance.projectsNumber,
      'avatarFileUrl': instance.imageUrl,
    };
