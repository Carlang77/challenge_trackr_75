class Habit {
  String title;
  bool isCompleted;

  Habit({required this.title, this.isCompleted = false});
}

class DailyProgress {
  final DateTime date;
  final int completedHabits;
  final int totalHabits;

  DailyProgress(
      {required this.date,
      required this.completedHabits,
      required this.totalHabits});
}

// Mock data representing a week of progress
List<DailyProgress> mockDailyProgress = [
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 6)),
      completedHabits: 4,
      totalHabits: 5),
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 5)),
      completedHabits: 5,
      totalHabits: 5),
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 4)),
      completedHabits: 3,
      totalHabits: 5),
  // Will add more entries for each day
];
