class ExerciseStep {
  final String title;
  final String instruction;
  final String? imageUrl;

  ExerciseStep({required this.title, required this.instruction, this.imageUrl});

  factory ExerciseStep.fromJson(Map<String, dynamic> json) {
    return ExerciseStep(
      title: json['title'],
      instruction: json['instruction'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'instruction': instruction, 'imageUrl': imageUrl};
  }
}

class Exercise {
  final String id;
  final String name;
  final String description;
  final String duration;
  final String difficulty;
  final String category;
  final String imageUrl;
  final String videoUrl;
  final List<String> muscleGroups;
  final List<ExerciseStep> steps;
  final String safetyTips;
  bool isFavorite;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.category,
    required this.imageUrl,
    required this.videoUrl,
    required this.muscleGroups,
    this.steps = const [],
    this.safetyTips = '',
    this.isFavorite = false,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      duration: json['duration'] ?? '',
      difficulty: json['difficulty'] ?? '',
      category: json['category'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      muscleGroups: List<String>.from(json['muscleGroups'] ?? []),
      steps:
          (json['steps'] as List?)
              ?.map((s) => ExerciseStep.fromJson(s))
              .toList() ??
          [],
      safetyTips: json['safetyTips'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
      'category': category,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'muscleGroups': muscleGroups,
      'steps': steps.map((s) => s.toJson()).toList(),
      'safetyTips': safetyTips,
      'isFavorite': isFavorite,
    };
  }
}
