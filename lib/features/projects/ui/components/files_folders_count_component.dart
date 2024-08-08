import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class FoldersFilesCountComponent extends StatelessWidget {
  const FoldersFilesCountComponent(
      {super.key, required this.files, required this.onClick});

  final int files;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 16,
                spreadRadius: 0,
                offset: const Offset(0, 4),
                color: SyncColors.darkBlue.withOpacity(0.3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          color: SyncColors.darkBlue),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$files",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: SyncColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
