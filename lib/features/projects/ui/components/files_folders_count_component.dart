import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class FoldersFilesCountComponent extends StatelessWidget {
  const FoldersFilesCountComponent({super.key, required this.files});

  final int files;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.file_present,
              color: SyncColors.pistach,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Project Files",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: SyncColors.darkBlue
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "$files",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: SyncColors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
