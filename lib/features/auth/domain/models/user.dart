import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final String name;
  final int companyId;

  const User(
      {required this.token,
      required this.name,
      required this.companyId,
      });

  @override
  List<Object> get props => [name, token, companyId];

  @override
  bool get stringify => true;
}
