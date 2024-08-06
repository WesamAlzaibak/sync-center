
import 'package:flutter/material.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/project.dart';

import '../../../../core/ui/theme/colors.dart';
import 'cover_image_component.dart';

class ProjectBaseInformationComponent extends StatelessWidget {
  const ProjectBaseInformationComponent({super.key, required this.onBackClick, required this.project});

  final void Function() onBackClick;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoverImageComponent(
          companyImageUrl: project.companyPicture,
          logoImageUrl: project.projectLogo,
          onBackPressed: onBackClick,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          project.title,
          style: const TextStyle(
            color: SyncColors.darkBlue,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Supervised by ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: SyncColors.grey,
                ),
              ),
              Text(
                project.companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: SyncColors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
