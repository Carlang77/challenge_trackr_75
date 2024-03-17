class DailyProgress {
  final DateTime date;
  final int completedHabits;
  final int totalHabits;

  DailyProgress({
    required this.date,
    required this.completedHabits,
    required this.totalHabits,
  });
}

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
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 3)),
      completedHabits: 5,
      totalHabits: 5),
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 2)),
      completedHabits: 4,
      totalHabits: 5),
  DailyProgress(
      date: DateTime.now().subtract(Duration(days: 1)),
      completedHabits: 5,
      totalHabits: 5),
];
