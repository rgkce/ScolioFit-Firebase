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

  List<Exercise> get exercises => _exercises;
  List<Exercise> get dailyRoutine => _dailyRoutine;
  List<Exercise> get recommendations => _recommendations;
  bool get isLoading => _isLoading;

  List<Exercise> get favorites =>
      _exercises.where((e) => e.isFavorite).toList();

  ExerciseProvider() {
    _init();
  }

  void updateUserId(String? userId) {
    // We no longer rely on userId for exercises as per requirements
    // but keeping the method for ProxyProvider compatibility if not yet removed from main.dart
    if (_exercises.isEmpty) {
      _init();
    }
  }

  Future<void> _init() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    try {
      _exercises = await _exerciseService.getAllExercises();
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
    if (_exercises.isEmpty) {
      _exercises = await _exerciseService.getAllExercises();
    }

    final showLoading = _dailyRoutine.isEmpty;
    if (showLoading) {
      _isLoading = true;
      notifyListeners();
    }

    try {
      // Check for today's routine in local storage
      // We ignore forceRefresh for "regeneration" as per requirement: "Page refresh must NOT regenerate"
      final savedIds = await _exerciseService.getSavedDailyRoutine();

      if (savedIds != null && savedIds.isNotEmpty) {
        final List<Exercise> tempRoutine = [];
        for (var id in savedIds) {
          final found = _exercises.where((e) => e.id == id).toList();
          if (found.isNotEmpty) {
            tempRoutine.add(found.first);
          }
        }

        if (tempRoutine.isNotEmpty) {
          _dailyRoutine = tempRoutine;
        } else {
          _dailyRoutine = _generateRandomRoutine();
        }
      } else {
        // No routine for today, generate once
        _dailyRoutine = _generateRandomRoutine();
        if (_dailyRoutine.isNotEmpty) {
          await _exerciseService.saveDailyRoutine(
            _dailyRoutine.map((e) => e.id).toList(),
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

    // Pick exercises not in the routine
    final pool = _exercises.where((e) => !routineIds.contains(e.id)).toList();
    if (pool.isEmpty) return;

    pool.shuffle(random);
    _recommendations = pool.take(4).toList();
  }

  List<Exercise> _generateRandomRoutine() {
    if (_exercises.isEmpty) return [];

    final random = Random();
    final List<Exercise> routine = [];

    // Categories to pick from
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
        routine.addAll(categoryExercises.take(2));
      }
    }

    // Safety fallback
    if (routine.length < 6 && _exercises.length >= 6) {
      final routineIds = routine.map((e) => e.id).toSet();
      final remaining =
          _exercises.where((e) => !routineIds.contains(e.id)).toList();
      remaining.shuffle(random);
      routine.addAll(remaining.take(max(0, 6 - routine.length)));
    }

    final result = routine.take(6).toList();
    result.shuffle(random);
    return result;
  }

  Future<void> toggleFavorite(String exerciseId) async {
    try {
      final masterIndex = _exercises.indexWhere((e) => e.id == exerciseId);
      if (masterIndex == -1) return;

      final newState = !_exercises[masterIndex].isFavorite;

      // Optimistic update
      _exercises[masterIndex].isFavorite = newState;

      // Sync other lists
      final dIndex = _dailyRoutine.indexWhere((e) => e.id == exerciseId);
      if (dIndex != -1) _dailyRoutine[dIndex].isFavorite = newState;

      final rIndex = _recommendations.indexWhere((e) => e.id == exerciseId);
      if (rIndex != -1) _recommendations[rIndex].isFavorite = newState;

      notifyListeners();

      // Persistence
      await _exerciseService.toggleFavorite(exerciseId);
    } catch (e) {
      debugPrint('ExerciseProvider: Error toggling favorite: $e');
    }
  }

  Future<void> logCompletion(String exerciseId) async {
    debugPrint('Exercise completed: $exerciseId');
  }

  List<Category> getCategories(String lang) {
    final categoryNamesEn =
        _exercises.map((e) => e.categories['en'] ?? '').toSet().toList();

    return categoryNamesEn.map((nameEn) {
      final exercisesInCat =
          _exercises.where((e) => e.categories['en'] == nameEn).toList();
      if (exercisesInCat.isEmpty) {
        return Category(id: nameEn, name: nameEn, icon: 'exercise');
      }
      final exercise = exercisesInCat.first;
      final localizedName = exercise.categories[lang] ?? nameEn;

      return Category(
        id: nameEn,
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
