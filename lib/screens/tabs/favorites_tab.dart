import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/exercise_provider.dart';
import '../../core/constants/app_strings.dart';
import '../exercise_detail_screen.dart';
import '../../widgets/exercise_card.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body:
          exerciseProvider.favorites.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color:
                          isDark ? const Color(0xFF64748B) : Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.get(context, 'no_favorites'),
                      style: TextStyle(
                        color:
                            isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: exerciseProvider.favorites.length,
                itemBuilder: (context, index) {
                  final exercise = exerciseProvider.favorites[index];
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
