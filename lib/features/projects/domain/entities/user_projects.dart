import 'package:equatable/equatable.dart';

class UserProjects extends Equatable {
  final int id;
  final String name;
  final DateTime createdDate;
  final String logo;

  const UserProjects({
    required this.name,
    required this.createdDate,
    required this.logo,
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
    name,
    createdDate,
    logo,
  ];
}
