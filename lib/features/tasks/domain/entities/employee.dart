import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String image;


  const Employee(
      {required this.id,
        required this.name,
        required this.image,
        });

  @override
  List<Object?> get props =>
      [id, name, image];

  @override
  bool get stringify => true;
}