import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/home/ui/components/meetings_info_bottom_sheet_component.dart';
import 'package:sync_center_mobile/features/meetings/ui/screens/meeetings_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../cubits/calender_cubit/calender_cubit.dart';
import '../cubits/calender_cubit/calender_state.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});

  static const route = "/CalenderScreen";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {


    return BlocListener<CalenderCubit, CalenderState>(
      listenWhen: (previousState, state) {
        return previousState is! CalenderErrorState &&
            state is CalenderErrorState;
      },
      listener: (BuildContext context, state) {
        if (state is CalenderErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
        }
      },
      child: BlocBuilder<CalenderCubit, CalenderState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              toolbarHeight: 60,
              leadingWidth: 80,
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () async {
                    await context.push(ClientMeetingsScreen.route);
                    _refreshIndicatorKey.currentState!.show();
                  },
                  child: const Icon(
                    Icons.calendar_month,
                    size: 30,
                    color: SyncColors.lightBlue,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              title: const Text(
                "Your Meetings",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: SyncColors.black,
                ),
              ),
            ),
            body: RefreshIndicator(
              edgeOffset: 32,
              key: _refreshIndicatorKey,
              onRefresh: () async {},
              color: SyncColors.darkBlue,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                      child: SizedBox(
                          height: 400,
                          child: SfCalendar(
                            view: CalendarView.week,
                            headerHeight: 50,
                            showDatePickerButton: true,
                            showCurrentTimeIndicator: true,
                            showNavigationArrow: true,
                            showTodayButton: true,
                            firstDayOfWeek: 6,
                            initialSelectedDate: DateTime.now(),
                            initialDisplayDate: DateTime.now(),
                            dataSource: state is CalenderSuccessState
                                ? MeetingDataSource(state.meetings)
                                : MeetingDataSource([]),
                            onTap: (calendarTapDetails) {
                              if (calendarTapDetails.appointments != null &&
                                  calendarTapDetails.appointments!.isNotEmpty) {
                                final MeetingAppointment appointment =
                                    calendarTapDetails.appointments!.first
                                        as MeetingAppointment;
                                final Meeting meeting = appointment.meeting;
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.grey[100],
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return MeetingsInformationBottomSheetComponent(
                                      meeting: meeting,
                                    );
                                  },
                                );
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source.map((meeting) {
      final appointment = MeetingAppointment(
        meeting: meeting,
        startTime: meeting.startDate,
        endTime: meeting.startDate.add(const Duration(hours: 2)),
        subject: meeting.title,
      );
      return appointment;
    }).toList();
  }
}

class MeetingAppointment extends Appointment {
  final Meeting meeting;

  MeetingAppointment({
    required this.meeting,
    required super.startTime,
    required super.endTime,
    required super.subject,
  });
}
