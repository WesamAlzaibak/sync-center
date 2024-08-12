import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/ui/theme/colors.dart';
import '../components/home_header_component.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});

  static const route = "/CalenderScreen";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    List<Appointment> meetings = [];
    final startDate = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,21);
    final endDate = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,23);
    final startDate2 = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+6,21);
    final endDate2 = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+6,23);
    meetings.add(Appointment(startTime: startDate, endTime: endDate,subject: "Moushref StandUp"));
    meetings.add(Appointment(startTime: startDate2, endTime: endDate2,subject: "Moushref Discus"));
    final meetingDataSource = MeetingDataSource(meetings);
    return Scaffold(
            backgroundColor: Colors.grey[100],
            body: Stack(
              children: [
                RefreshIndicator(
                  edgeOffset: 32,
                  key: _refreshIndicatorKey,
                  onRefresh: ()async{},
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
                              dataSource: meetingDataSource,
                              onTap: (date){

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: HomeHeaderComponent(
                    userName: "Wesam Alzaibak",
                  ),
                ),
              ],
            ),
          );

  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}