import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercise.dart';
import '../services/exercise_service.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const ExerciseCard({super.key, required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  exercise.imageUrl.startsWith('http')
                      ? Image.network(
                        exercise.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (_, __, ___) => Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.fitness_center,
                                color: Colors.grey,
                              ),
                            ),
                      )
                      : Image.asset(
                        exercise.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (_, __, ___) => Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.fitness_center,
                                color: Colors.grey,
                              ),
                            ),
                      ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${exercise.duration} • ${exercise.difficulty}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                exercise.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: exercise.isFavorite ? Colors.red : Colors.grey[400],
                size: 24,
              ),
              onPressed: () {
                context.read<ExerciseService>().toggleFavorite(exercise.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
