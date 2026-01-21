import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/exercise_service.dart';
import '../models/category.dart';
import '../widgets/exercise_card.dart';
import 'exercise_detail_screen.dart';

class CategoryExercisesScreen extends StatelessWidget {
  final Category category;

  const CategoryExercisesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final exerciseService = context.watch<ExerciseService>();
    final exercises = exerciseService.getExercisesByCategory(category.name);

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body:
          exercises.isEmpty
              ? const Center(child: Text('No exercises found in this category'))
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
