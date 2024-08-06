import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/ui/reusables/images/moushref_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../projects/domain/entities/project.dart';

class CompanyProjectsListView extends StatelessWidget {
  const CompanyProjectsListView({
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
          return isLoading
              ? _ProjectItem(
                  onClick: () {
                    onProjectClick(projects[index]);
                  },
                  isLoading: true,
                  imageUrl: null,
                  project: const Project(
                      title: "Moushref Project",
                      companyName: "R-link Company",
                      companyPicture: "",
                      id: -10,
                      projectLogo: "",
                      description:
                          "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it."),
                )
              : _ProjectItem(
                  onClick: () {
                    onProjectClick(projects[index]);
                  },
                  imageUrl: projects[index].projectLogo,
                  project: projects[index],
                  isLoading: false,
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
    required this.project,
    required this.onClick,
    required this.imageUrl,
    required this.isLoading,
  });

  final Project project;
  final bool isLoading;
  final String? imageUrl;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: SyncNetworkImage(
                        imageUrl: imageUrl ?? "",
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        project.title,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: SyncColors.f1,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  project.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: SyncColors.f1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
