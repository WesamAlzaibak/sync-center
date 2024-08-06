import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int id;
  final String name;
  final String description;
  final String email;
  final String location;
  final String phoneNumber;
  final int projectsNumber;
  final int employeesNumber;
  final String imageUrl;

  const Company({
    required this.name,
    required this.id,
    required this.description,
    required this.email,
    required this.location,
    required this.phoneNumber,
    required this.imageUrl,
    required this.projectsNumber,
    required this.employeesNumber,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        email,
        location,
    phoneNumber,
        imageUrl,
    projectsNumber,
    employeesNumber,
      ];
}
