import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../models/exercise.dart';
import '../providers/exercise_provider.dart';
import '../core/constants/app_strings.dart';
import 'exercise_timer_screen.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({super.key, required this.exercise});

  Widget _buildImage(
    String imageUrl, {
    required bool isDark,
    BoxFit fit = BoxFit.cover,
  }) {
    final placeholderBg =
        isDark ? AppColors.darkPlaceholder : AppColors.lightPlaceholder;
    final placeholderIconColor = isDark ? AppColors.darkSubtext : Colors.grey;

    try {
      if (imageUrl.isEmpty) {
        return _buildPlaceholder(placeholderBg, placeholderIconColor);
      }

      if (imageUrl.startsWith('http')) {
        return Image.network(
          imageUrl,
          fit: fit,
          errorBuilder:
              (_, __, ___) =>
                  _buildPlaceholder(placeholderBg, placeholderIconColor),
        );
      } else {
        return Image.asset(
          imageUrl,
          fit: fit,
          errorBuilder:
              (_, __, ___) =>
                  _buildPlaceholder(placeholderBg, placeholderIconColor),
        );
      }
    } catch (e) {
      return _buildPlaceholder(placeholderBg, placeholderIconColor);
    }
  }

  Widget _buildPlaceholder(Color bgColor, Color iconColor) {
    return Container(
      color: bgColor,
      child: Center(
        child: Icon(Icons.fitness_center, size: 80, color: iconColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bodyTextColor =
        isDark ? AppColors.darkBodyText : AppColors.lightBodyText;
    final subtextColor = isDark ? AppColors.darkSubtext : AppColors.lightSubtext;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: isDark ? Colors.black54 : Colors.white70,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color:
                    isDark
                        ? AppColors.darkSurface
                        : AppColors.lightPlaceholder,
                child: _buildImage(
                  exercise.imageUrl,
                  isDark: isDark,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            actions: [
              Consumer<ExerciseProvider>(
                builder: (context, provider, _) {
                  final currentExercise =
                      provider.getExerciseById(exercise.id) ?? exercise;
                  final isFav = currentExercise.isFavorite;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: isDark ? Colors.black54 : Colors.white70,
                      child: IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color:
                              isFav
                                  ? Colors.red
                                  : (isDark ? Colors.white : Colors.black87),
                        ),
                        onPressed: () => provider.toggleFavorite(exercise.id),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          exercise.title(lang),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: isDark ? 0.2 : 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          exercise.difficulty(lang),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exercise.category(lang),
                    style: TextStyle(
                      color: subtextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    exercise.description(lang),
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: bodyTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildInfoTile(
                        context,
                        Icons.timer_outlined,
                        exercise.formattedDuration,
                        bodyTextColor,
                      ),
                      const SizedBox(width: 24),
                      _buildInfoTile(
                        context,
                        Icons.fitness_center,
                        '${exercise.muscleGroups(lang).length} ${AppStrings.get(context, 'muscle_groups')}',
                        bodyTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    AppStrings.get(context, 'instructions'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...exercise.steps.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      step.title(lang),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      step.instruction(lang),
                                      style: TextStyle(
                                        fontSize: 15,
                                        height: 1.4,
                                        color: bodyTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (step.imageUrl != null) ...[
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: double.infinity,
                                height: 180,
                                color:
                                    isDark
                                        ? AppColors.darkSurface
                                        : AppColors.lightPlaceholder,
                                child: _buildImage(
                                  step.imageUrl!,
                                  isDark: isDark,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                  if (exercise.safetyTips(lang).isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(
                          alpha: isDark ? 0.15 : 0.1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber.withValues(
                            alpha: isDark ? 0.4 : 0.3,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: isDark ? Colors.amber[300] : Colors.amber,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.get(context, 'safety_tips'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark
                                            ? Colors.amber[300]
                                            : Colors.amber[900],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  exercise.safetyTips(lang),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        isDark
                                            ? Colors.amber[100]
                                            : const Color(0xFF78350F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 32),
                  Text(
                    AppStrings.get(context, 'muscle_groups'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        exercise
                            .muscleGroups(lang)
                            .map(
                              (muscle) => Chip(
                                label: Text(
                                  muscle,
                                  style: TextStyle(
                                    color:
                                        isDark
                                            ? AppColors.darkBodyText
                                            : AppColors.lightBodyText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor:
                                    isDark
                                        ? AppColors.darkSurface
                                        : AppColors.lightPlaceholder,
                                side: BorderSide(
                                  color:
                                      isDark
                                          ? AppColors.darkBorder
                                          : AppColors.lightBorder,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ExerciseTimerScreen(exercise: exercise),
                ),
              );
            },
            child: Text(AppStrings.get(context, 'start_exercise')),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    IconData icon,
    String label,
    Color textColor,
  ) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).primaryColor),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
        ),
      ],
    );
  }
}
