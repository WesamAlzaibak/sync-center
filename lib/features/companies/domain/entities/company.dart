import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int id;
  final String name;

  //final String description;
  final String email;

  //final String location;
  final String phoneNumber;
  final int projectsNumber;

  final int employeesNumber;
  final String logo;

  const Company({
    required this.name,
    required this.id,
    //required this.description,
    required this.email,
    //required this.location,
    required this.phoneNumber,
    required this.logo,
    required this.projectsNumber,
    required this.employeesNumber,
  });

  @override
  List<Object> get props => [
        id,
        name,
        //description,
        email,
        //location,
        phoneNumber,
        logo,
        projectsNumber,
        employeesNumber,
      ];
}
