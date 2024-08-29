import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DefaultSnackBar extends SnackBar {
  DefaultSnackBar({super.key, required String text})
      : super(
          content: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: SyncColors.black,
        );
}
