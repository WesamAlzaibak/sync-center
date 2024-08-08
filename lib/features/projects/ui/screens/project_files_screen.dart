import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/dummy_data.dart';
import 'package:sync_center_mobile/features/projects/ui/components/files_list_view_component.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/theme/colors.dart';

class ProjectFilesScreen extends StatelessWidget {
   ProjectFilesScreen({super.key, required this.projectName});

  static const route = "/ProjectFilesScreen";

  final String projectName;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  void openFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true
    );
    if(result !=null){
      PlatformFile platformFile = result.files.first;
    }
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
        title: Text(
          "$projectName Files",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: SyncColors.black,
          ),
        ),
        leadingWidth: 64,
        leading: Row(
          children: [
            const SizedBox(width: 16),
            DefaultBackButton(onPressed: () => context.pop()),
          ],
        ),
      ),
      body: RefreshIndicator(
        edgeOffset: 0,
        key: _refreshIndicatorKey,
        color: SyncColors.darkBlue,
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Skeletonizer(
            enabled: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This is The files of $projectName Project \n you can follow files that reflect indicators of the progress of your project, special designs, and important files in it",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: SyncColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilesListViewComponent(projectFile: projectFilesList,
                    isLoading: false,
                    onFileClick: (String url) => _launchInBrowser(url),),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: SyncColors.background,
        onPressed: ()=>openFile(),
        child: const Icon(
          Icons.file_upload,
          color: SyncColors.darkBlue,
          size: 30,
        ),
      ),
    );
  }
}
