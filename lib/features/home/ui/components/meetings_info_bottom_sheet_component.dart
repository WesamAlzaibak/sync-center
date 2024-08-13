import 'package:flutter/material.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../meetings/domain/entities/meeting.dart';
import 'package:intl/intl.dart';

class MeetingsInformationBottomSheetComponent extends StatelessWidget {
  const MeetingsInformationBottomSheetComponent(
      {super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "You have a meeting with from the ${meeting.requesterType}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: SyncColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Meeting Details:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: SyncColors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Meeting Title  : ",
                  style: TextStyle(
                    color: SyncColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Text(
                  meeting.title,
                  style: const TextStyle(
                    color: SyncColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Meeting Date : ",
                  style: TextStyle(
                    color: SyncColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "from ${DateFormat('dd/MM/yyyy HH:mm').format(meeting.startDate)}",
                      style: const TextStyle(
                        color: SyncColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "to      ${DateFormat('dd/MM/yyyy HH:mm').format(meeting.startDate.add(const Duration(hours: 2)))}",
                      style: const TextStyle(
                        color: SyncColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: SyncColors.lightBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: meeting.company.logo == ""
                          ? Center(
                              child: Text(
                                meeting.company.name[0].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: SyncColors.darkBlue,
                                ),
                              ),
                            )
                          : SyncNetworkImage(
                              imageUrl: meeting.company.logo,
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Meeting with ${meeting.company.name}",
                      style: const TextStyle(
                          color: SyncColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
