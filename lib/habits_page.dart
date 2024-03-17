import 'package:flutter/material.dart';
import 'habit.dart';
import 'habit_data.dart';

class HabitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockHabits.length,
      itemBuilder: (context, index) {
        final habit = mockHabits[index];
        return CheckboxListTile(
          title: Text(habit.title),
          value: habit.isCompleted,
          onChanged: (bool? value) {
            // Note: This won't work as expected since the widget is stateless.
            // You would need to use a state management approach to properly handle changes.
          },
        );
      },
    );
  }
}
