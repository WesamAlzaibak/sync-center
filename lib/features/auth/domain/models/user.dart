import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final String name;

  const User(
      {required this.token,
      required this.name,});

  @override
  List<Object> get props => [name, token,];

  @override
  bool get stringify => true;
}
