// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => EmployeeDto(
  name: json['name'] as String,
  id: (json['id'] as num).toInt(),
  image: json['image'] as String? ??
      'https://img.freepik.com/free-photo/view-child-hair-salon_23-2150462483.jpg',
);

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
