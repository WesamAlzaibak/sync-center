import 'package:flutter/material.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';

class CoverImageComponent extends StatelessWidget {
  const CoverImageComponent(
      {super.key,
      required this.companyImageUrl,
      required this.logoImageUrl,
      required this.onBackPressed,
      required this.companyName,
      required this.projectName});

  final String companyImageUrl;
  final String logoImageUrl;
  final void Function() onBackPressed;
  final String companyName;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 77.5),
            child: Container(
              color: SyncColors.pink,
              height: 240,
              child: companyImageUrl == ""
                  ? Center(
                      child: Text(
                        "By ${companyName.toUpperCase()} Company",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: SyncColors.darkBlue,
                        ),
                      ),
                    )
                  : SyncNetworkImage(
                      imageUrl: companyImageUrl,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
            )),
        Positioned(
          top: 160,
          child: CircleAvatar(
            radius: 79,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 77.5,
              child: logoImageUrl.isEmpty
                  ? Center(
                      child: Text(
                        projectName[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: SyncColors.darkBlue,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: SyncNetworkImage(
                        imageUrl: logoImageUrl,
                        width: 155,
                        height: 155,
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 48,
          child: DefaultBackButton(
            onPressed: onBackPressed,
          ),
        )
      ],
    );
  }
}
