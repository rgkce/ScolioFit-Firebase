import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../models/exercise.dart';
import '../providers/exercise_provider.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const ExerciseCard({super.key, required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final placeholderBg =
        isDark ? AppColors.darkPlaceholder : AppColors.lightPlaceholder;
    final placeholderIconColor = isDark ? AppColors.darkSubtext : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : Colors.transparent,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 80,
                height: 80,
                color: placeholderBg,
                child:
                    exercise.imageUrl.startsWith('http')
                        ? Image.network(
                          exercise.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                          errorBuilder:
                              (_, __, ___) => Center(
                                child: Icon(
                                  Icons.fitness_center,
                                  color: placeholderIconColor,
                                ),
                              ),
                        )
                        : Image.asset(
                          exercise.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                          errorBuilder:
                              (_, __, ___) => Center(
                                child: Icon(
                                  Icons.fitness_center,
                                  color: placeholderIconColor,
                                ),
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
                    exercise.title(
                      Localizations.localeOf(context).languageCode,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${exercise.formattedDuration} • ${exercise.difficulty(Localizations.localeOf(context).languageCode)}',
                    style: TextStyle(
                      color:
                          isDark
                              ? AppColors.darkSubtext
                              : AppColors.lightSubtext,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                exercise.isFavorite ? Icons.favorite : Icons.favorite_border,
                color:
                    exercise.isFavorite
                        ? Colors.red
                        : (isDark
                            ? AppColors.darkSubtext
                            : Colors.grey[400]),
                size: 24,
              ),
              onPressed: () {
                context.read<ExerciseProvider>().toggleFavorite(exercise.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
