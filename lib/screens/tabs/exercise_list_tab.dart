import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/exercise_service.dart';
import '../category_exercises_screen.dart';

class ExerciseListTab extends StatelessWidget {
  const ExerciseListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseService = context.watch<ExerciseService>();

    return Scaffold(
      body:
          exerciseService.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: exerciseService.categories.length,
                itemBuilder: (context, index) {
                  final category = exerciseService.categories[index];
                  return GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    CategoryExercisesScreen(category: category),
                          ),
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _getIcon(category.icon),
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'accessibility':
        return Icons.accessibility;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'directions_run':
        return Icons.directions_run;
      default:
        return Icons.category;
    }
  }
}
