import 'package:calender_tutorial/meeting.dart';
import 'package:calender_tutorial/meeting_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference 1', startTime, endTime, const Color(0xFF0F8644), false));
        meetings.add(Meeting(
        'Conference 2', startTime, endTime, const Color(0xFF0F8644), false));
        meetings.add(Meeting(
        'Conference 3', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        cellBorderColor: Colors.red,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.indicator, showAgenda: true),
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle
        ),
        blackoutDates: [
          DateTime.now().add(const Duration(hours: 48)),
          DateTime.now().add(const Duration(hours: 24)),
        ],
      ),
    );
  }
}
