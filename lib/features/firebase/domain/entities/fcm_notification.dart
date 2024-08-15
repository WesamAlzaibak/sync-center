import 'package:equatable/equatable.dart';

class FcmNotification extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final bool isSeen;

  const FcmNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isSeen,
  });

  @override
  List<Object?> get props => [id, title, description, date, isSeen];

  @override
  bool get stringify => true;
}
