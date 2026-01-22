import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import '../data/exercise_data.dart';

class ExerciseService {
  static const String _favoritesKey = 'favorite_exercises';
  static const String _routineKey = 'daily_routine';
  static const String _routineDateKey = 'routine_date';

  /// Loads all exercises from static data, synced with local favorites
  Future<List<Exercise>> getAllExercises() async {
    final favorites = await getFavoriteIds();
    return ExerciseData.exercises.map((e) {
      return e.copyWith(isFavorite: favorites.contains(e.id));
    }).toList();
  }

  /// Returns favorite exercises
  Future<List<Exercise>> getFavoriteExercises() async {
    final all = await getAllExercises();
    return all.where((e) => e.isFavorite).toList();
  }

  /// PERSISTENCE: Favorites
  Future<List<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<void> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];

    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    await prefs.setStringList(_favoritesKey, favorites);
  }

  /// PERSISTENCE: Daily Routine
  Future<List<String>?> getSavedDailyRoutine() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString(_routineDateKey);
    final today = _getTodayString();

    if (savedDate == today) {
      return prefs.getStringList(_routineKey);
    }
    return null;
  }

  Future<void> saveDailyRoutine(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_routineDateKey, _getTodayString());
    await prefs.setStringList(_routineKey, ids);
  }

  String _getTodayString() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }
}
