import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_center_mobile/features/home/ui/components/meetings_info_bottom_sheet_component.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../meetings/domain/entities/meeting.dart';
import '../components/home_header_component.dart';
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
            body: Stack(
              children: [
                RefreshIndicator(
                  edgeOffset: 32,
                  key: _refreshIndicatorKey,
                  onRefresh: () async {},
                  color: SyncColors.darkBlue,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
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
                              dataSource: state is CalenderSuccessState?MeetingDataSource(state.meetings):MeetingDataSource([]),
                              onTap: (calendarTapDetails) {
                                if (calendarTapDetails.appointments != null && calendarTapDetails.appointments!.isNotEmpty) {
                                  final MeetingAppointment appointment = calendarTapDetails.appointments!.first as MeetingAppointment;
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
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: HomeHeaderComponent(
                    userName: "Wesam Alzaibak",
                    icon: Icons.calendar_month,
                    onIconPressed: () {},
                    isHomeScreen: false,
                  ),
                ),
              ],
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
      return MeetingAppointment(
        meeting: meeting,
        startTime: meeting.startDate,
        endTime: meeting.startDate.add(const Duration(hours: 2)),
        subject: meeting.title,
      );
    }).toList();
  }
}


class MeetingAppointment extends Appointment {
  final Meeting meeting;

  MeetingAppointment({
    required this.meeting,
    required DateTime startTime,
    required DateTime endTime,
    required String subject,
  }) : super(
    startTime: startTime,
    endTime: endTime,
    subject: subject,
  );
}