import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/core/ui/reusables/buttons/default_button.dart';
import 'package:sync_center_mobile/features/companies/domain/entities/company.dart';
import 'package:sync_center_mobile/features/meetings/domain/entities/meeting.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import 'package:intl/intl.dart';

import '../../domain/enums/status_name_enum.dart';

class ClientMeetingsListViewComponent extends StatelessWidget {
  const ClientMeetingsListViewComponent(
      {super.key,
      required this.meetings,
      required this.isLoading,
      required this.onMeetingAcceptClick,
      required this.onMeetingDeleteClick,
      required this.onMeetingRejectClick});

  final List<Meeting> meetings;
  final void Function(int) onMeetingAcceptClick;
  final void Function(int) onMeetingRejectClick;
  final void Function(int) onMeetingDeleteClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => isLoading
          ? MeetingsItems(
              meeting: Meeting(
                title: '/////////////////////////////////////////////////',
                id: -1,
                requesterType: 'COMPANY',
                startDate: DateTime.now(),
                statusName: StatusNameEnum.accepted,
                company: const Company(
                    name: "R-Link",
                    id: -1,
                    email: "example@gmail.com",
                    phoneNumber: "+963995967227",
                    logo: "",
                    projectsNumber: 0,
                    employeesNumber: 0),
              ),
              isLoading: true,
              requesterImageUrl: '',
              onMeetingAcceptClick: () {},
              onMeetingRejectClick: () {},
              onMeetingDeleteClick: () {},
            )
          : MeetingsItems(
              meeting: meetings[index],
              isLoading: false,
              requesterImageUrl: meetings[index].company.logo,
              onMeetingAcceptClick: () =>
                  onMeetingAcceptClick(meetings[index].id),
              onMeetingRejectClick: () =>
                  onMeetingRejectClick(meetings[index].id),
              onMeetingDeleteClick: () =>
                  onMeetingDeleteClick(meetings[index].id),
            ),
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: isLoading ? 3 : meetings.length,
    );
  }
}

class MeetingsItems extends StatelessWidget {
  const MeetingsItems({
    super.key,
    required this.meeting,
    required this.requesterImageUrl,
    required this.onMeetingAcceptClick,
    required this.onMeetingRejectClick,
    required this.isLoading,
    required this.onMeetingDeleteClick,
  });

  final Meeting meeting;
  final String? requesterImageUrl;
  final void Function() onMeetingAcceptClick;
  final void Function() onMeetingDeleteClick;
  final void Function() onMeetingRejectClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(8)),
                    color: meeting.statusName == StatusNameEnum.accepted
                        ? SyncColors.green
                        : meeting.statusName == StatusNameEnum.rejected
                            ? SyncColors.red
                            : SyncColors.lightBlue),
                child: Center(
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: Text(
                      meeting.statusName.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            "Subject: ${meeting.title}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: SyncColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Requested by ${meeting.requesterType}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: SyncColors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: requesterImageUrl == null
                                      ? ClipOval(
                                          child: Image.asset(
                                            "assets/images/loading_image.jpg",
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : requesterImageUrl!.isEmpty
                                          ? Center(
                                              child: Text(
                                                meeting.company.name[0]
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700,
                                                  color: SyncColors.darkBlue,
                                                ),
                                              ),
                                            )
                                          : ClipOval(
                                              child: SyncNetworkImage(
                                                imageUrl: requesterImageUrl!,
                                                height: 60,
                                                width: 60,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Meeting with: ${meeting.company.name}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: SyncColors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "from ${DateFormat('dd/MM/yyyy HH:mm').format(meeting.startDate)}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: SyncColors.grey,
                                        ),
                                      ),
                                      Text(
                                        "to      ${DateFormat('dd/MM/yyyy HH:mm').format(meeting.startDate.add(const Duration(hours: 2)))}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: SyncColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            (meeting.statusName == StatusNameEnum.pending &&
                                    meeting.requesterType != "User")
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: DefaultButton(
                                          onPressed: onMeetingAcceptClick,
                                          text: "Accept",
                                          textColor: Colors.white,
                                          backgroundColor: SyncColors.lightBlue,
                                          width: 160,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: DefaultButton(
                                          onPressed: onMeetingRejectClick,
                                          text: "Reject",
                                          textColor: Colors.white,
                                          backgroundColor: SyncColors.red,
                                          width: 160,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isLoading
            ? const SizedBox()
            : meeting.statusName == StatusNameEnum.accepted||(meeting.statusName == StatusNameEnum.pending&&meeting.requesterType=="User")
                ? Positioned(
                    right: 16,
                    top: 16,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: SyncColors.red.withOpacity(0.20),
                      child: Center(
                        child: GestureDetector(
                          onTap: onMeetingDeleteClick,
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: SyncColors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
      ],
    );
  }
}
