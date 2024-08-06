import 'package:flutter/material.dart';

import '../../../../core/ui/reusables/images/moushref_network_image.dart';
import '../../../../core/ui/theme/colors.dart';

class SupervisedByComponent extends StatelessWidget {
  const SupervisedByComponent({super.key, required this.logoImageUrl, required this.companyName});

  final String logoImageUrl;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 33,
          child: ClipOval(
            child: SyncNetworkImage(
              imageUrl: logoImageUrl,
              width: 66,
              height: 66,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "Supervised by $companyName",
          style: const TextStyle(
              color: SyncColors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
