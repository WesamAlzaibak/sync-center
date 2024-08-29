import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class ProjectDescriptionComponent extends StatelessWidget {
  const ProjectDescriptionComponent({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "About the Project : ",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: SyncColors.darkBlue),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              description,
              expandText: "Read More",
              animation: true,
              maxLines: 4,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: SyncColors.black),
              expandOnTextTap: true,
            ),
          ),
        ),
      ],
    );
  }
}
