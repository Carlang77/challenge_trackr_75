import 'dart:convert';

class Habit {
  String title;
  List<DateTime> completionDates;

  Habit({
    required this.title,
    List<DateTime>? completionDates,
  }) : this.completionDates = completionDates ?? [];

  // Removed the isCompleted flag

  // Check if the habit is completed on a given date
  bool isCompletedOn(DateTime date) {
    return completionDates
        .any((completionDate) => isSameDay(completionDate, date));
  }

  // Toggle the completion status for a given date
  void toggleCompleted(DateTime completionDate) {
    final index =
        completionDates.indexWhere((date) => isSameDay(date, completionDate));
    if (index == -1) {
      completionDates.add(completionDate); // Add if not completed on this date
    } else {
      completionDates.removeAt(index); // Remove if already completed
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completionDates':
          completionDates.map((date) => date.toIso8601String()).toList(),
    };
  }

  static Habit fromJson(Map<String, dynamic> json) {
    return Habit(
      title: json['title'],
      completionDates: (json['completionDates'] as List)
          .map((dateStr) => DateTime.parse(dateStr))
          .toList(),
    );
  }

  // Helper function to compare dates without considering time
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
