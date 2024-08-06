import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int id;
  final String title;
  final String companyName;
  final String companyPicture;
  final String projectLogo;
  final String description;

  const Project({
    required this.title,
    required this.companyName,
    required this.companyPicture,
    required this.id,
    required this.projectLogo,
    required this.description,
  });

  @override
  List<Object> get props => [
        id,
        title,
        companyName,
        companyPicture,
        projectLogo,
        description,
      ];
}
