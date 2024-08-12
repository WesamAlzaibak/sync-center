import 'package:equatable/equatable.dart';

class Meeting extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  const Meeting({
    required this.title,
    required this.description,
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object> get props => [
    id,
    title,
    description,
    startDate,
    endDate,
  ];
}
