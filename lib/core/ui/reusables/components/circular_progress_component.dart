import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class CircularProgressComponent extends StatelessWidget {
  const CircularProgressComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        color: SyncColors.darkBlue,
      ),
    );
  }
}
