import 'package:flutter/material.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/images/moushref_network_image.dart';

class CoverImageComponent extends StatelessWidget {
  const CoverImageComponent({super.key, required this.companyImageUrl, required this.logoImageUrl, required this.onBackPressed});

  final String companyImageUrl;
  final String logoImageUrl;
  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 77.5),
          child: Container(
            color: Colors.grey,
            height: 240,
            child: SyncNetworkImage(
              imageUrl: companyImageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
          )
        ),
        Positioned(
          top: 160,
          child: CircleAvatar(
            radius: 79,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 77.5,
              child: ClipOval(
                child: SyncNetworkImage(
                  imageUrl: logoImageUrl,
                  width: 155,
                  height: 155,
                  fit: BoxFit.cover,
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
