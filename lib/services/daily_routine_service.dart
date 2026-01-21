import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import 'dart:math';

class DailyRoutineService {
  static const String _routineKey = 'daily_routine_ids';
  static const String _dateKey = 'last_routine_date';

  /// Generates or retrieves today's routine
  Future<List<Exercise>> getDailyRoutine(List<Exercise> allExercises) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final lastDate = prefs.getString(_dateKey);

    if (lastDate == today) {
      final savedIds = prefs.getStringList(_routineKey) ?? [];

      // Check if all saved IDs still exist in the current list
      final validExercises =
          savedIds
              .map((id) => allExercises.where((e) => e.id == id).firstOrNull)
              .whereType<Exercise>()
              .toList();

      // If we found all of them and they are unique, return them
      if (validExercises.length == savedIds.length && savedIds.isNotEmpty) {
        return validExercises;
      }
      // Otherwise (ID mismatch or missing data), fall through to generate a new one
    }

    // Date changed or no routine saved: generate new one
    final newRoutine = _generateRandomRoutine(allExercises);
    await prefs.setString(_dateKey, today);
    await prefs.setStringList(
      _routineKey,
      newRoutine.map((e) => e.id).toList(),
    );

    return newRoutine;
  }

  List<Exercise> _generateRandomRoutine(List<Exercise> allExercises) {
    if (allExercises.isEmpty) return [];

    final random = Random();
    final List<Exercise> routine = [];

    // Group exercises by category to ensure variety
    final Map<String, List<Exercise>> grouped = {};
    for (var e in allExercises) {
      grouped.putIfAbsent(e.category, () => []).add(e);
    }

    // 1. Pick one random exercise from each category first
    for (var category in grouped.keys) {
      final categoryList = grouped[category]!;
      if (categoryList.isNotEmpty) {
        final picked = categoryList[random.nextInt(categoryList.length)];
        routine.add(picked);
      }
    }

    // 2. Fill the rest until we hit ~10 minutes
    int currentMinutes = _calculateTotalMinutes(routine);
    final targetMinutes = 10;

    // Create a pool of remaining exercises
    final List<Exercise> pool =
        allExercises.where((e) => !routine.any((r) => r.id == e.id)).toList();
    pool.shuffle(random);

    for (var exercise in pool) {
      if (currentMinutes >= targetMinutes) break;

      int duration = _parseDurationMinutes(exercise.duration);
      // If adding this doesn't put us way over (e.g., max 13 mins)
      if (currentMinutes + duration <= 13) {
        routine.add(exercise);
        currentMinutes += duration;
      }
    }

    // Shuffle final routine so it's not always cat1 -> cat2 -> cat3
    routine.shuffle(random);
    return routine;
  }

  int _calculateTotalMinutes(List<Exercise> list) {
    return list.fold(0, (sum, e) => sum + _parseDurationMinutes(e.duration));
  }

  int _parseDurationMinutes(String durationStr) {
    // Matches "2 min", "3 dk", "5 min", etc.
    final match = RegExp(r'(\d+)').firstMatch(durationStr);
    if (match != null) {
      return int.tryParse(match.group(1)!) ?? 0;
    }
    return 0;
  }
}
