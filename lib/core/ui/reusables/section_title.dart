import 'package:flutter/material.dart';

import '../../utils/app_local.dart';
import '../theme/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.onSeeAllClicked,
    this.showSeeMore = true,
  });

  final String title;
  final void Function() onSeeAllClicked;
  final bool showSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: SyncColors.black,
            ),
          ),
        ),
        if(showSeeMore)
          InkWell(
            onTap: onSeeAllClicked,
            child: Text(
              getLang(context, "see_all"),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                decoration: TextDecoration.underline,
                color: SyncColors.black,
              ),
            ),
          )
      ],
    );
  }
}
