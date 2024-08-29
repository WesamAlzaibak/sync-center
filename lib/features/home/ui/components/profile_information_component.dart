import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/date.dart';


class ProfileInformationComponent extends StatelessWidget {
  const ProfileInformationComponent({super.key, required this.name, required this.createDate, required this.email, required this.companyLogo, required this.companyName, required this.companyEmail});

  final String name;
  final DateTime createDate;
  final String email;
  final String companyLogo;
  final String companyName;
  final String companyEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: SyncColors.black,
                ),
              ),
              Text(
                "created at: ${isToday(createDate) ? "today" : DateFormat('dd/MM/yyyy').format(createDate)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: SyncColors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.email_outlined,
              size: 25,
              color: SyncColors.darkBlue,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              email,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: SyncColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "working with : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: SyncColors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: companyLogo.isEmpty
                            ? Center(
                          child: Text(
                            companyName[0]
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight:
                              FontWeight.w700,
                              color: SyncColors
                                  .darkBlue,
                            ),
                          ),
                        )
                            : ClipOval(
                          child: SyncNetworkImage(
                            imageUrl:
                            companyLogo,
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        companyName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          color: SyncColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.email_outlined,
                        size: 25,
                        color: SyncColors.darkBlue,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        companyEmail,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: SyncColors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
