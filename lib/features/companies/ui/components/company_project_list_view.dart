import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/features/projects/domain/entities/user_projects.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/date.dart';

class CompanyProjectsListView extends StatelessWidget {
  const CompanyProjectsListView({
    super.key,
    required this.isLoading,
    required this.projects,
  });

  final bool isLoading;
  final List<UserProjects> projects;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return isLoading
              ? _ProjectItem(
                  isLoading: true,
                  projectLogo: null,
                  project: UserProjects(
                    name: "Moushref Project",
                    id: -10,
                    logo: "",
                    createdDate: DateTime(2027, 7, 7),
                  ),)
              : _ProjectItem(
                  projectLogo: projects[index].logo,
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
    required this.projectLogo,
    required this.isLoading,
  });

  final UserProjects project;
  final bool isLoading;
  final String? projectLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: projectLogo == ""
                      ? Center(
                          child: Text(
                            project.name[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: SyncColors.darkBlue,
                            ),
                          ),
                        )
                      : SyncNetworkImage(
                          imageUrl: projectLogo ?? "",
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
                    project.name,
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
              "Created Time: ${isToday(project.createdDate) ? "today" : DateFormat('dd/MM/yyyy').format(project.createdDate)}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: SyncColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
