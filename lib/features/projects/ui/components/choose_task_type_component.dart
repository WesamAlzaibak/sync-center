import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class ChooseTaskTypeComponent extends StatelessWidget {
  const ChooseTaskTypeComponent({super.key, required this.onClick, required this.title, required this.titleColor});

  final void Function() onClick;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: titleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
