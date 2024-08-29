import 'package:equatable/equatable.dart';
import 'package:sync_center_mobile/features/companies/domain/entities/company.dart';
import 'package:sync_center_mobile/features/meetings/domain/enums/status_name_enum.dart';

class Meeting extends Equatable {
  final int id;
  final String title;
  final String requesterType;
  final DateTime startDate;
  final StatusNameEnum statusName;
  final Company company;


  const Meeting({
    required this.title,
    required this.requesterType,
    required this.id,
    required this.startDate,
    required this.statusName,
    required this.company,
  });

  @override
  List<Object> get props => [
    id,
    title,
    requesterType,
    startDate,
    statusName,
    company,
  ];
}
