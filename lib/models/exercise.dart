class Exercise {
  final String id;
  final Map<String, String> titles; // Map of 'en', 'tr'
  final Map<String, String> categories;
  final int duration; // in seconds
  final Map<String, String> descriptions;
  final String imagePath;
  final Map<String, String> difficulties;
  final Map<String, List<String>> muscleGroupsMap;
  final List<ExerciseStep> steps;
  final Map<String, String> safetyTipsMap;
  bool isFavorite;

  Exercise({
    required this.id,
    required this.titles,
    required this.categories,
    required this.duration,
    required this.descriptions,
    required this.imagePath,
    this.difficulties = const {'en': 'Beginner', 'tr': 'Başlangıç'},
    this.muscleGroupsMap = const {'en': [], 'tr': []},
    this.steps = const [],
    this.safetyTipsMap = const {'en': '', 'tr': ''},
    this.isFavorite = false,
  });

  // Getters for UI compatibility with locale
  String title(String lang) => titles[lang] ?? titles['en'] ?? '';
  String category(String lang) => categories[lang] ?? categories['en'] ?? '';
  String description(String lang) =>
      descriptions[lang] ?? descriptions['en'] ?? '';
  String difficulty(String lang) =>
      difficulties[lang] ?? difficulties['en'] ?? '';
  List<String> muscleGroups(String lang) =>
      muscleGroupsMap[lang] ?? muscleGroupsMap['en'] ?? [];
  String safetyTips(String lang) =>
      safetyTipsMap[lang] ?? safetyTipsMap['en'] ?? '';

  // Backward compatibility getters (default to English or first available)
  String get name => titles['en'] ?? titles.values.first;
  String get imageUrl => imagePath;
  String get formattedDuration {
    if (duration < 60) return '$duration sec';
    final mins = duration ~/ 60;
    final secs = duration % 60;
    if (secs == 0) return '$mins min';
    return '$mins min $secs sec';
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] ?? '',
      titles: Map<String, String>.from(json['titles'] ?? {}),
      categories: Map<String, String>.from(json['categories'] ?? {}),
      duration: json['duration'] ?? 60,
      descriptions: Map<String, String>.from(json['descriptions'] ?? {}),
      imagePath: json['imagePath'] ?? '',
      difficulties: Map<String, String>.from(json['difficulties'] ?? {}),
      muscleGroupsMap:
          (json['muscleGroupsMap'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, List<String>.from(v)),
          ) ??
          {},
      steps:
          (json['steps'] as List?)
              ?.map((s) => ExerciseStep.fromJson(s))
              .toList() ??
          [],
      safetyTipsMap: Map<String, String>.from(json['safetyTipsMap'] ?? {}),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titles': titles,
      'categories': categories,
      'duration': duration,
      'descriptions': descriptions,
      'imagePath': imagePath,
      'difficulties': difficulties,
      'muscleGroupsMap': muscleGroupsMap,
      'steps': steps.map((s) => s.toJson()).toList(),
      'safetyTipsMap': safetyTipsMap,
      'isFavorite': isFavorite,
    };
  }

  Exercise copyWith({bool? isFavorite}) {
    return Exercise(
      id: id,
      titles: titles,
      categories: categories,
      duration: duration,
      descriptions: descriptions,
      imagePath: imagePath,
      difficulties: difficulties,
      muscleGroupsMap: muscleGroupsMap,
      steps: steps,
      safetyTipsMap: safetyTipsMap,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // Temporary factory for legacy code compatibility
  factory Exercise.fromFirestore(dynamic doc) {
    return Exercise(
      id: '0',
      titles: {'en': 'Legacy'},
      categories: {'en': 'Legacy'},
      duration: 0,
      descriptions: {'en': ''},
      imagePath: '',
    );
  }
}

class ExerciseStep {
  final Map<String, String> titles;
  final Map<String, String> instructions;
  final String? imageUrl;

  ExerciseStep({
    required this.titles,
    required this.instructions,
    this.imageUrl,
  });

  String title(String lang) => titles[lang] ?? titles['en'] ?? '';
  String instruction(String lang) =>
      instructions[lang] ?? instructions['en'] ?? '';

  factory ExerciseStep.fromJson(Map<String, dynamic> json) {
    return ExerciseStep(
      titles: Map<String, String>.from(json['titles'] ?? {}),
      instructions: Map<String, String>.from(json['instructions'] ?? {}),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titles': titles,
      'instructions': instructions,
      'imageUrl': imageUrl,
    };
  }
}
