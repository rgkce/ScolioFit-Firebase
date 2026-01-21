import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import '../data/exercise_data.dart';
import 'firestore_service.dart';

class ExerciseService {
  final FirestoreService _firestoreService = FirestoreService();
  static const String _favoritesKey = 'favorite_exercises';
  static const String _routineKey = 'daily_routine';
  static const String _routineDateKey = 'routine_date';

  /// Loads all exercises from static data, synced with cloud/local favorites
  Future<List<Exercise>> getAllExercises({String? userId}) async {
    final favorites = await getFavoriteIds(userId: userId);
    return ExerciseData.exercises.map((e) {
      return e.copyWith(isFavorite: favorites.contains(e.id));
    }).toList();
  }

  /// Returns exercises by category
  Future<List<Exercise>> getExercisesByCategory(
    String categoryEn, {
    String? userId,
  }) async {
    final all = await getAllExercises(userId: userId);
    return all.where((e) => e.categories['en'] == categoryEn).toList();
  }

  /// Returns favorite exercises
  Future<List<Exercise>> getFavoriteExercises({String? userId}) async {
    final all = await getAllExercises(userId: userId);
    return all.where((e) => e.isFavorite).toList();
  }

  /// Returns exercises by ID
  Future<Exercise?> getExerciseById(String id, {String? userId}) async {
    final all = await getAllExercises(userId: userId);
    try {
      return all.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  /// PERSISTENCE: Favorites
  Future<List<String>> getFavoriteIds({String? userId}) async {
    if (userId != null) {
      try {
        return await _firestoreService.getFavoritesOnce(userId);
      } catch (e) {
        print('Error fetching cloud favorites: $e');
      }
    }

    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<void> toggleFavorite(String id, {String? userId}) async {
    final favorites = await getFavoriteIds(userId: userId);
    final isNowFavorite = !favorites.contains(id);

    if (userId != null) {
      await _firestoreService.toggleFavorite(userId, id, isNowFavorite);
    } else {
      final prefs = await SharedPreferences.getInstance();
      if (!isNowFavorite) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  /// PERSISTENCE: Daily Routine
  Future<List<String>?> getSavedDailyRoutine({String? userId}) async {
    if (userId != null) {
      return await _firestoreService.getDailyRoutine(userId, _getTodayString());
    }

    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString(_routineDateKey);
    final today = _getTodayString();

    if (savedDate == today) {
      return prefs.getStringList(_routineKey);
    }
    return null;
  }

  Future<void> saveDailyRoutine(List<String> ids, {String? userId}) async {
    if (userId != null) {
      await _firestoreService.saveDailyRoutine(userId, _getTodayString(), ids);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_routineDateKey, _getTodayString());
      await prefs.setStringList(_routineKey, ids);
    }
  }

  String _getTodayString() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }
}
