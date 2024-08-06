import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/core/ui/theme/colors.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/project.dart';

import '../../../../core/ui/reusables/images/moushref_network_image.dart';

class MyProjectsListView extends StatelessWidget {
  const MyProjectsListView({
    super.key,
    required this.isLoading,
    required this.onProjectClick,
    required this.projects,
  });

  final bool isLoading;
  final List<Project> projects;
  final void Function(Project) onProjectClick;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return
                isLoading
                  ? _ProjectItem(
                  onClick: () {
                    onProjectClick(projects[index]);
                  },
                  title: "Moushref Project For WEsam",
                  projectLogo:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
                  description:
                  "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it.", companyName: 'R-Link', isLoading: true,

                )
                  :
              _ProjectItem(
            onClick: () {
              onProjectClick(projects[index]);
            },
            title: "Moushref Project For WEsam",
            projectLogo:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
            description:
                "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it.", companyName: 'R-Link', isLoading: false,
          );
        },
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
        itemCount: projects.length,
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({
    required this.title,
    required this.projectLogo,
    required this.onClick,
    required this.isLoading,
    required this.description, required this.companyName,
  });

  final String title;
  final String projectLogo;
  final String description;
  final String companyName;
  final bool isLoading;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onClick,
        child: Skeletonizer(
          enabled: isLoading,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 16,
                  spreadRadius: 0,
                    offset: const Offset(0,4),
                  color: SyncColors.black.withOpacity(0.12)
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 25,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: SyncNetworkImage(
                          imageUrl: projectLogo,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: SyncColors.f1,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 2),
                                Text(
                                  "Supervised by $companyName Company",
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: SyncColors.background,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: SyncColors.f1
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
