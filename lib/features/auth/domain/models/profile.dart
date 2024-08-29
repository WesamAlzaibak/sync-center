import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String name;
  final DateTime createDate;
  final String image;
  final String email;

  const Profile(
      {required this.id,
      required this.name,
      required this.createDate,
      required this.image,
      required this.email,});

  @override
  List<Object> get props => [name, id, createDate, image, email];

  @override
  bool get stringify => true;
}
