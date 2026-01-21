import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/exercise_service.dart';
import '../../services/auth_service.dart';
import '../../core/constants/app_strings.dart';
import '../exercise_detail_screen.dart';
import '../../widgets/exercise_card.dart';

class DailyRoutineTab extends StatelessWidget {
  const DailyRoutineTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final exerciseService = context.watch<ExerciseService>();
    final user = authService.user;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => exerciseService.fetchDailyRoutine(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.get(context, 'hello')}, ${user?.fullName ?? "User"} 👋',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.get(context, 'daily_routine_desc'),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),
              if (exerciseService.isLoading)
                const Center(child: CircularProgressIndicator())
              else if (exerciseService.dailyRoutine.isEmpty)
                Center(
                  child: Text(AppStrings.get(context, 'no_exercises_today')),
                )
              else
                ...exerciseService.dailyRoutine.map(
                  (exercise) => Padding(
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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
