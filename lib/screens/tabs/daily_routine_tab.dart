import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/exercise_provider.dart';
import '../../providers/auth_provider.dart';
import '../../core/constants/app_strings.dart';
import '../exercise_detail_screen.dart';
import '../../widgets/exercise_card.dart';

class DailyRoutineTab extends StatelessWidget {
  const DailyRoutineTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final exerciseProvider = context.watch<ExerciseProvider>();
    final user = authProvider.user;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => exerciseProvider.fetchDailyRoutine(forceRefresh: true),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.get(context, 'hello')}, ${user?.fullName ?? AppStrings.get(context, 'guest')} 👋',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.get(context, 'daily_routine_desc'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark ? const Color(0xFF94A3B8) : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              if (exerciseProvider.isLoading)
                const Center(child: CircularProgressIndicator())
              else ...[
                if (exerciseProvider.dailyRoutine.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.get(context, 'daily_plan'),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...exerciseProvider.dailyRoutine.map(
                    (exercise) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ExerciseCard(
                        exercise: exercise,
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => ExerciseDetailScreen(
                                      exercise: exercise,
                                    ),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
                if (exerciseProvider.recommendations.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.get(context, 'recommended_for_you'),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...exerciseProvider.recommendations.map(
                    (exercise) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ExerciseCard(
                        exercise: exercise,
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => ExerciseDetailScreen(
                                      exercise: exercise,
                                    ),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
                if (exerciseProvider.dailyRoutine.isEmpty &&
                    exerciseProvider.recommendations.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Text(
                        AppStrings.get(context, 'no_exercises_today'),
                        style: TextStyle(
                          color:
                              isDark
                                  ? const Color(0xFF94A3B8)
                                  : Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
