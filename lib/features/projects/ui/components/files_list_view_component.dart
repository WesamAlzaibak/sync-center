import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/reusables/images/sync_expanded_image.dart';
import '../../../../core/ui/theme/colors.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/date.dart';
import '../../../files/domain/entities/project_file.dart';
import '../../utils/file_type_utils.dart';

class FilesListViewComponent extends StatelessWidget {
  const FilesListViewComponent(
      {super.key,
      required this.projectFile,
      required this.isLoading,
      required this.onFileClick});

  final List<ProjectFile> projectFile;
  final void Function(String) onFileClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => isLoading
          ? FilesItems(
              projectFile: ProjectFile(
                url: '/////////////////////////////////////////////////',
                id: -1,
                userName: 'Lorem Ipsum',
                userPicture: '',
                date: DateTime(2024,8,7),
              ),
              isLoading: true,
              fileImageUrl: "",
              userImageUrl: "",
              onFileClick: () {},
            )
          : FilesItems(
              projectFile: projectFile[index],
              fileImageUrl: projectFile[index].url,
              isLoading: isLoading,
              userImageUrl: projectFile[index].userPicture,
              onFileClick: () => onFileClick(projectFile[index].url),
            ),
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: isLoading ? 3 : projectFile.length,
    );
  }
}

class FilesItems extends StatelessWidget {
  const FilesItems({
    super.key,
    required this.projectFile,
    this.fileImageUrl,
    required this.userImageUrl,
    required this.onFileClick,
    required this.isLoading,
  });

  final ProjectFile projectFile;
  final String? fileImageUrl;
  final String? userImageUrl;
  final void Function() onFileClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onFileClick,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Skeletonizer(
              enabled: isLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "published by ${projectFile.userName}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: SyncColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (fileImageUrl == null)
                      ? Center(
                          child: Image.asset(
                            "assets/images/loading_image.jpg",
                            height: 180,
                            fit: BoxFit.fill,
                          ),
                        )
                      : FileTypeUtils.isImageFile(fileImageUrl!)
                          ? Center(
                              child: SyncNetworkImageWithoutWidth(
                                  imageUrl: fileImageUrl!,
                                  height: 180,
                                  fit: BoxFit.fill),
                            )
                          : Center(
                              child: Image.asset(
                                FileTypeUtils.fileType(fileImageUrl!),
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                            ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: userImageUrl == null
                              ? ClipOval(
                                  child: Image.asset(
                                    "assets/images/loading_image.jpg",
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : userImageUrl!.isEmpty
                                  ? Center(
                                      child: Text(
                                        projectFile.userName[0].toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          color: SyncColors.darkBlue,
                                        ),
                                      ),
                                    )
                                  : ClipOval(
                                      child: SyncNetworkImage(
                                        imageUrl: userImageUrl!,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projectFile.url.substring(
                                    projectFile.url.lastIndexOf('/') + 1),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: SyncColors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                isToday(projectFile.date)
                                    ? "published Today"
                                    : "published in ${DateFormat('dd/MM/yyyy').format(projectFile.date)}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: SyncColors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
