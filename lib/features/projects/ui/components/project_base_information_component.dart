import 'package:flutter/material.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/project.dart';

import '../../../../core/ui/theme/colors.dart';
import 'cover_image_component.dart';

class ProjectBaseInformationComponent extends StatelessWidget {
  const ProjectBaseInformationComponent({
    super.key,
    required this.onBackClick,
    required this.project,
    required this.companyName,
    required this.companyLogo,
    required this.onCompanyNamePressed,
  });

  final void Function() onBackClick;
  final void Function() onCompanyNamePressed;
  final Project project;
  final String companyName;
  final String companyLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoverImageComponent(
          companyImageUrl: companyLogo,
          logoImageUrl: project.logo,
          onBackPressed: onBackClick,
          companyName: companyName,
          projectName: project.name,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          project.name,
          style: const TextStyle(
            color: SyncColors.darkBlue,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        TextButton(
          onPressed: onCompanyNamePressed,
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
                companyName.toUpperCase(),
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
