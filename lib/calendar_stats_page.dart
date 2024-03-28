import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habit Tracker Stats"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              // Configure more properties according to your needs
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Longest Daily Streak: 3 days",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text("Longest Skip Streak: 2 days",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text("Weekly Goal Streak: 5 weeks",
                      style: TextStyle(fontSize: 18)),
                  // Dynamically calculate and display these values
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
