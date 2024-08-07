import 'package:equatable/equatable.dart';

class ProjectFile extends Equatable {
  final int id;
  final String url;
  final String userName;
  final String userPicture;
  final DateTime date;

  const ProjectFile({
    required this.url,
    required this.userName,
    required this.userPicture,
    required this.id,
    required this.date,
  });

  @override
  List<Object> get props => [
    id,
    userName,
    url,
    userPicture,
    date,
  ];
}
