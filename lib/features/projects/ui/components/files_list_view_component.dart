import 'package:flutter/material.dart';
import 'package:sync_center_mobile/core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/reusables/images/sync_expanded_image.dart';
import '../../../../core/ui/theme/colors.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/date.dart';
import '../../../files/domain/entities/project_file.dart';

class FilesListViewComponent extends StatelessWidget {
  const FilesListViewComponent({super.key, required this.projectFile, required this.isLoading, required this.onFileClick});

  final List<ProjectFile> projectFile;
  final void Function(String) onFileClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => isLoading
          ? FilesItems(
        projectFile: ProjectFile(url: '/////////////////////////////////////////////////', userName: 'Lorem Ipsum', userPicture: '', id: -1, date: DateTime(2024,8,7),),
        fileImageUrl: null,
        userImageUrl: null, onFileClick: (){},
      )
          : FilesItems(
        projectFile: projectFile[index],
        fileImageUrl: projectFile[index].url,
        userImageUrl: projectFile[index].userPicture, onFileClick:()=>onFileClick(projectFile[index].url),
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
  const FilesItems({super.key, required this.projectFile, this.fileImageUrl, required this.userImageUrl, required this.onFileClick});

  final ProjectFile projectFile;
  final String? fileImageUrl;
  final String? userImageUrl;
  final void Function() onFileClick;

  bool isImageFile(String url){
    String x = projectFile.url
        .substring(projectFile.url.lastIndexOf('.') + 1);
    return (x== "png"||x=="jpg"||x=="jpeg"||x == "svg"||x == "pjp"||x == "pjpeg"||x == "jfif"||x == "webp");
  }

  String fileType(String url){
    String imageSuffix = projectFile.url
        .substring(projectFile.url.lastIndexOf('.') + 1);
    if(imageSuffix=="xlsx"){
      return "assets/images/excel_file_image.png";
    }
    else if (imageSuffix == "txt")
      {
        return "assets/images/txt_file_image.jpeg";
      }
    else if (imageSuffix == "pdf")
    {
      return "assets/images/pdf_files_image.jpg";
    }
    else if (imageSuffix == "zip")
    {
      return "assets/images/zip_file_image.jpg";
    }
    else if(imageSuffix == "docx")
      {
        return "assets/images/word_files_image.jpeg";
      }
    else
    {
      return "assets/images/file_image.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Material(
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
            isImageFile(fileImageUrl!)?Center(
              child: SyncNetworkImageWithoutWidth(
                  imageUrl: fileImageUrl!, height: 180, fit: BoxFit.fill),
            ):
            Center(
              child: Image.asset(
                  fileType(fileImageUrl!),
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
                    child: ClipOval(
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
                          projectFile.url
                              .substring(projectFile.url.lastIndexOf('/') + 1),
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
    );
  }
}
