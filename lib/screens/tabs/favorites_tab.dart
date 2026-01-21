import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/exercise_service.dart';
import '../../core/constants/app_strings.dart';
import '../exercise_detail_screen.dart';
import '../../widgets/exercise_card.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseService = context.watch<ExerciseService>();

    return Scaffold(
      body:
          exerciseService.favorites.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.get(context, 'no_favorites'),
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: exerciseService.favorites.length,
                itemBuilder: (context, index) {
                  final exercise = exerciseService.favorites[index];
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
