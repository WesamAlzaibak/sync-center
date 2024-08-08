import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/core/ui/theme/colors.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/utils/date.dart';
import 'package:intl/intl.dart';
import '../../../projects/domain/entities/user_projects.dart';

class MyProjectsListView extends StatelessWidget {
  const MyProjectsListView({
    super.key,
    required this.isLoading,
    required this.onProjectClick,
    required this.projects,
  });

  final bool isLoading;
  final List<UserProjects> projects;
  final void Function(int) onProjectClick;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return isLoading
              ? _ProjectItem(
                  onClick: () {},
                  title: "Moushref Project For WEsam",
                  projectLogo: 'https://en.chessbase.com/thumb/91753',
                  date: DateTime(2026, 4, 5),
                  isLoading: true,
                )
              : _ProjectItem(
                  onClick: () {
                    onProjectClick(index);
                  },
                  title: projects[index].name,
                  projectLogo: projects[index].logo,
                  date: projects[index].createdDate,
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
        itemCount: isLoading ? 3 : projects.length,
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({
    required this.title,
    required this.projectLogo,
    required this.onClick,
    required this.date,
    required this.isLoading,
  });

  final String title;
  final String projectLogo;
  final DateTime date;
  final void Function() onClick;
  final bool isLoading;

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
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 16,
                spreadRadius: 0,
                offset: const Offset(0, 4),
                color: SyncColors.black.withOpacity(0.12),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: isLoading ? SyncColors.lightBlue : null,
                      child: projectLogo == ''
                          ? Text(
                              title[0].toUpperCase(),
                              style: const TextStyle(
                                color: SyncColors.darkBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            )
                          : SyncNetworkImage(
                              imageUrl: projectLogo,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: SyncColors.f1,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Created Time : ${isToday(date) ? "today" : DateFormat('dd/MM/yyyy').format(date)}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: SyncColors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
