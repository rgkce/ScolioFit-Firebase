import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../models/category.dart';
import '../services/exercise_service.dart';
import 'dart:math';

class ExerciseProvider extends ChangeNotifier {
  final ExerciseService _exerciseService = ExerciseService();

  List<Exercise> _exercises = [];
  List<Exercise> _dailyRoutine = [];
  List<Exercise> _recommendations = [];
  bool _isLoading = false;
  String? _userId;

  List<Exercise> get exercises => _exercises;
  List<Exercise> get dailyRoutine => _dailyRoutine;
  List<Exercise> get recommendations => _recommendations;
  bool get isLoading => _isLoading;

  List<Exercise> get favorites =>
      _exercises.where((e) => e.isFavorite).toList();

  void updateUserId(String? userId) {
    if (_userId == userId) return;
    _userId = userId;
    _init();
  }

  Future<void> _init() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    try {
      _exercises = await _exerciseService.getAllExercises(userId: _userId);
      await fetchDailyRoutine();
      _generateRecommendations();
    } catch (e) {
      debugPrint('ExerciseProvider: Initialization Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDailyRoutine({bool forceRefresh = false}) async {
    if (_exercises.isEmpty) return;

    final showLoading = _dailyRoutine.isEmpty || forceRefresh;
    if (showLoading) {
      _isLoading = true;
      notifyListeners();
    }

    try {
      final savedIds =
          forceRefresh
              ? null
              : await _exerciseService.getSavedDailyRoutine(userId: _userId);

      if (savedIds != null && savedIds.isNotEmpty && savedIds.length == 6) {
        final List<Exercise> tempRoutine = [];
        for (var id in savedIds) {
          final found = _exercises.where((e) => e.id == id).toList();
          if (found.isNotEmpty) {
            tempRoutine.add(found.first);
          }
        }

        if (tempRoutine.length == 6) {
          _dailyRoutine = tempRoutine;
        } else {
          _dailyRoutine = _generateRandomRoutine();
        }
      } else {
        _dailyRoutine = _generateRandomRoutine();
        if (_dailyRoutine.isNotEmpty) {
          await _exerciseService.saveDailyRoutine(
            _dailyRoutine.map((e) => e.id).toList(),
            userId: _userId,
          );
        }
      }
      _generateRecommendations();
    } catch (e) {
      debugPrint('ExerciseProvider: Error in fetchDailyRoutine: $e');
    } finally {
      if (showLoading) {
        _isLoading = false;
      }
      notifyListeners();
    }
  }

  void _generateRecommendations() {
    if (_exercises.isEmpty) return;

    final random = Random();
    final routineIds = _dailyRoutine.map((e) => e.id).toSet();

    // Pick 3-4 exercises not in the routine
    final pool = _exercises.where((e) => !routineIds.contains(e.id)).toList();
    pool.shuffle(random);
    _recommendations = pool.take(4).toList();
  }

  List<Exercise> _generateRandomRoutine() {
    if (_exercises.isEmpty) return [];

    final random = Random();
    final List<Exercise> routine = [];

    // Categories to pick from (exactly these 3)
    final categoriesEn = ['Stretching', 'Strength', 'Mobility'];

    for (var cat in categoriesEn) {
      final categoryExercises =
          _exercises
              .where(
                (e) =>
                    (e.categories['en'] ?? '').toLowerCase() ==
                    cat.toLowerCase(),
              )
              .toList();

      if (categoryExercises.isNotEmpty) {
        categoryExercises.shuffle(random);
        // Take up to 2
        routine.addAll(categoryExercises.take(2));
      }
    }

    // Safety fallback: if for some reason we still don't have 6
    // fill with random ones that are not already picked
    if (routine.length < 6 && _exercises.length >= 6) {
      final routineIds = routine.map((e) => e.id).toSet();
      final remaining =
          _exercises.where((e) => !routineIds.contains(e.id)).toList();
      remaining.shuffle(random);
      routine.addAll(remaining.take(6 - routine.length));
    }

    // Ensure we take exactly 6 and shuffle them
    final result = routine.take(6).toList();
    result.shuffle(random);
    return result;
  }

  Future<void> toggleFavorite(String exerciseId) async {
    try {
      // Find current state
      final masterIndex = _exercises.indexWhere((e) => e.id == exerciseId);
      if (masterIndex == -1) return;

      final newState = !_exercises[masterIndex].isFavorite;

      // Optimistic update
      _exercises[masterIndex].isFavorite = newState;

      // Sync daily routine
      final dIndex = _dailyRoutine.indexWhere((e) => e.id == exerciseId);
      if (dIndex != -1) _dailyRoutine[dIndex].isFavorite = newState;

      // Sync recommendations
      final rIndex = _recommendations.indexWhere((e) => e.id == exerciseId);
      if (rIndex != -1) _recommendations[rIndex].isFavorite = newState;

      notifyListeners();

      // Backend update
      await _exerciseService.toggleFavorite(exerciseId, userId: _userId);
    } catch (e) {
      debugPrint('ExerciseProvider: Error toggling favorite: $e');
      // On error, we might want to revert, but keeping it simple for now
    }
  }

  Future<void> logCompletion(String exerciseId) async {
    debugPrint('Exercise completed: $exerciseId');
  }

  List<Category> getCategories(String lang) {
    // We use the English name as the ID/key to filter exercises consistently
    final categoryNamesEn =
        _exercises.map((e) => e.categories['en'] ?? '').toSet().toList();

    return categoryNamesEn.map((nameEn) {
      // Find an exercise in this category to get the localized name
      final exercise = _exercises.firstWhere(
        (e) => e.categories['en'] == nameEn,
      );
      final localizedName = exercise.categories[lang] ?? nameEn;

      return Category(
        id: nameEn, // Keep English name as ID for internal filtering
        name: localizedName,
        icon: _getIconForCategory(nameEn),
      );
    }).toList();
  }

  String _getIconForCategory(String categoryEn) {
    switch (categoryEn.toLowerCase()) {
      case 'stretching':
      case 'flexibility':
        return 'accessibility';
      case 'strength':
      case 'core':
        return 'fitness_center';
      case 'mobility':
        return 'directions_run';
      default:
        return 'exercise';
    }
  }

  List<Exercise> getExercisesByCategory(String categoryEn) {
    // Filter using the English ID
    return _exercises.where((e) => e.categories['en'] == categoryEn).toList();
  }

  Exercise? getExerciseById(String id) {
    try {
      return _exercises.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}
