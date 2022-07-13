import 'package:agendamento/pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPage extends StatefulWidget {
  const AddPage({this.eventDay, Key? key}) : super(key: key);

  final DateTime? eventDay;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {

    CalendarFormat calendarFormat = CalendarFormat.month;
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusedDay,
              calendarFormat: calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDay = selectedDay;
                  focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              onFormatChanged: (format) {
                if (calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                focusedDay = focusedDay;
              },
            ),
          ],
        ),
      ),
    );
  }
}
