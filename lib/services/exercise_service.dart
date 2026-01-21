import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import '../models/category.dart';
import '../data/mock_exercises.dart';
import 'daily_routine_service.dart';

class ExerciseService extends ChangeNotifier {
  final DailyRoutineService _dailyRoutineService = DailyRoutineService();

  List<Exercise> _exercises = [];
  List<Exercise> _favorites = [];
  List<Exercise> _dailyRoutine = [];
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Exercise> get exercises => _exercises;
  List<Exercise> get favorites => _favorites;
  List<Exercise> get dailyRoutine => _dailyRoutine;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  String _currentLocale = 'tr';

  ExerciseService() {
    // Initial fetch will be triggered by updateLocale or _init
  }

  Future<void> updateLocale(String locale) async {
    if (_currentLocale == locale && _exercises.isNotEmpty) return;
    _currentLocale = locale;
    await fetchExercises();
    await fetchDailyRoutine();
  }

  Future<void> fetchExercises() async {
    _isLoading = true;
    notifyListeners();

    // Simulating local load
    await Future.delayed(const Duration(milliseconds: 100));
    _exercises = MockExerciseData.getExercises(_currentLocale);
    _categories = MockExerciseData.getCategories(_currentLocale);

    // Load favorites from local storage
    await _loadFavorites();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favorite_ids') ?? [];

    for (var exercise in _exercises) {
      exercise.isFavorite = favoriteIds.contains(exercise.id);
    }
    _favorites = _exercises.where((e) => e.isFavorite).toList();
  }

  Future<void> fetchDailyRoutine() async {
    if (_exercises.isEmpty) {
      _exercises = MockExerciseData.getExercises(_currentLocale);
    }
    _dailyRoutine = await _dailyRoutineService.getDailyRoutine(_exercises);
    notifyListeners();
  }

  Future<void> toggleFavorite(String exerciseId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favorite_ids') ?? [];

    final exercise = _exercises.firstWhere((e) => e.id == exerciseId);

    if (favoriteIds.contains(exerciseId)) {
      favoriteIds.remove(exerciseId);
      exercise.isFavorite = false;
    } else {
      favoriteIds.add(exerciseId);
      exercise.isFavorite = true;
    }

    await prefs.setStringList('favorite_ids', favoriteIds);
    _favorites = _exercises.where((e) => e.isFavorite).toList();

    // Also update instances in daily routine if they exist
    _updateLocalState(_dailyRoutine, exerciseId, exercise.isFavorite);

    notifyListeners();
  }

  Future<void> fetchFavorites() async {
    await _loadFavorites();
    notifyListeners();
  }

  Exercise? getExerciseById(String id) {
    try {
      return _exercises.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  void _updateLocalState(List<Exercise> list, String id, bool state) {
    final index = list.indexWhere((e) => e.id == id);
    if (index != -1) {
      list[index].isFavorite = state;
    }
  }

  List<Exercise> getExercisesByCategory(String category) {
    return _exercises.where((e) => e.category == category).toList();
  }
}
