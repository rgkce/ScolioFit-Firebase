import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercise_provider.dart';
import '../models/category.dart';
import '../widgets/exercise_card.dart';
import 'exercise_detail_screen.dart';

class CategoryExercisesScreen extends StatelessWidget {
  final Category category;

  const CategoryExercisesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();
    final exercises = exerciseProvider.getExercisesByCategory(category.id);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body:
          exercises.isEmpty
              ? Center(
                child: Text(
                  'No exercises found',
                  style: TextStyle(
                    color: isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ExerciseCard(
                      exercise: exercise,
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (_) =>
                                      ExerciseDetailScreen(exercise: exercise),
                            ),
                          ),
                    ),
                  );
                },
              ),
    );
  }
}
