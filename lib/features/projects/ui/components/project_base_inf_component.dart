import 'package:flutter/material.dart';

import '../../domain/entities/project.dart';

class TripItemHistoryComponent extends StatelessWidget {
  const TripItemHistoryComponent({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
