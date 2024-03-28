import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:challenge_trackr_75/model/habit.dart';
import 'package:challenge_trackr_75/model/daily_progress.dart';

class HabitManager with ChangeNotifier {
  List<Habit> _habits = [];
  List<DailyProgress> _dailyProgress = [];

  List<Habit> get habits => _habits;
  List<DailyProgress> get dailyProgress => _dailyProgress;

  HabitManager() {
    loadHabits();
    loadDailyProgress();
  }

  void toggleHabitCompletion(String habitTitle, DateTime completionDate) {
    final habitIndex = _habits.indexWhere((habit) => habit.title == habitTitle);
    if (habitIndex != -1) {
      _habits[habitIndex].toggleCompleted(
          completionDate); // Updated to use toggleCompleted with completionDate
      updateDailyProgress(completionDate);
      notifyListeners();
      saveHabits();
    }
  }

  void updateDailyProgress(DateTime date) {
    // Attempt to find a DailyProgress instance for the given date.
    DailyProgress progress = _dailyProgress.firstWhere(
      (prog) => isSameDay(prog.date, date),
      orElse: () => DailyProgress(
          date: date,
          completedHabits: 0, // Initialize with 0 completed habits
          totalHabits: _habits.length // Total habits count at this point
          ),
    );

    // If there's no existing entry for the date, add the new one.
    if (!_dailyProgress.any((prog) => isSameDay(prog.date, date))) {
      _dailyProgress.add(progress);
    }

    // Now that we have the correct DailyProgress instance, update its values.
    progress.completedHabits =
        _habits.where((habit) => habit.isCompletedOn(date)).length;
    progress.totalHabits = _habits.length;

    notifyListeners();
    saveDailyProgress();
  }

  Future<void> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitData = prefs.getString('habits');
    if (habitData != null) {
      final List<dynamic> decodedData = json.decode(habitData);
      _habits = decodedData.map((data) => Habit.fromJson(data)).toList();
    }
    notifyListeners();
  }

  Future<void> saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
        json.encode(_habits.map((habit) => habit.toJson()).toList());
    await prefs.setString('habits', encodedData);
  }

  Future<void> loadDailyProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final progressData = prefs.getString('dailyProgress');
    if (progressData != null) {
      final List<dynamic> decodedData = json.decode(progressData);
      _dailyProgress =
          decodedData.map((data) => DailyProgress.fromJson(data)).toList();
    }
    notifyListeners();
  }

  Future<void> saveDailyProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
        json.encode(_dailyProgress.map((dp) => dp.toJson()).toList());
    await prefs.setString('dailyProgress', encodedData);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
