import 'dart:math';
import '../models/exercise_model.dart';

class RoutineService {
  static List<ExerciseModel> generateDailyRoutine(
    List<ExerciseModel> allExercises,
  ) {
    final random = Random();

    List<ExerciseModel> mobility =
        allExercises.where((e) => e.category == 'Mobilite').toList();

    List<ExerciseModel> strength =
        allExercises.where((e) => e.category == 'Güçlendirme').toList();

    List<ExerciseModel> stretchBreath =
        allExercises
            .where((e) => e.category == 'Esneme' || e.category == 'Nefes')
            .toList();

    mobility.shuffle(random);
    strength.shuffle(random);
    stretchBreath.shuffle(random);

    return [...mobility.take(2), ...strength.take(2), ...stretchBreath.take(1)];
  }
}
