class DailyProgress {
  DateTime date;
  int completedHabits;
  int totalHabits;

  DailyProgress({
    required this.date,
    required this.completedHabits,
    required this.totalHabits,
  });

  void updateProgress(int completed, int total) {
    completedHabits = completed;
    totalHabits = total;
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'completedHabits': completedHabits,
      'totalHabits': totalHabits,
    };
  }

  factory DailyProgress.fromJson(Map<String, dynamic> json) {
    return DailyProgress(
      date: DateTime.parse(json['date']),
      completedHabits: json['completedHabits'],
      totalHabits: json['totalHabits'],
    );
  }
}
