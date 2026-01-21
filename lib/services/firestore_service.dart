import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exercise.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // --- Exercises ---
  Stream<List<Exercise>> getExercises() {
    return _db
        .collection('exercises')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Exercise.fromFirestore(doc)).toList(),
        );
  }

  Future<List<Exercise>> getExercisesOnce() async {
    try {
      final snapshot = await _db.collection('exercises').get();
      if (snapshot.docs.isEmpty) {
        await seedExercisesIfNeeded();
        final retrySnapshot = await _db.collection('exercises').get();
        return retrySnapshot.docs
            .map((doc) => Exercise.fromFirestore(doc))
            .toList();
      }
      return snapshot.docs.map((doc) => Exercise.fromFirestore(doc)).toList();
    } catch (e) {
      print('Firestore read error: $e');
      if (e.toString().contains('permission-denied')) {
        print(
          'Kritik: Firebase Console üzerinden Firestore Kurallarını (Rules) güncellemeniz gerekiyor!',
        );
      }
      return [];
    }
  }

  Future<void> seedExercisesIfNeeded() async {
    final snapshot = await _db.collection('exercises').limit(1).get();
    if (snapshot.docs.isNotEmpty) return;

    final List<Map<String, dynamic>> initialExercises = [
      {
        "name": "Postür Farkındalığı",
        "description":
            "Günlük duruş farkındalığını artırarak omurga hizasını destekler.",
        "duration": "30-60 saniye",
        "difficulty": "Başlangıç",
        "category": "Postür",
        "imageUrl":
            "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Omurga", "Omuz"],
        "steps": [
          {"title": "Hazırlık", "instruction": "Aynanın karşısına geçin."},
          {
            "title": "Kontrol",
            "instruction": "Omuz ve kalça hizasını kontrol edin.",
          },
          {
            "title": "Duruş",
            "instruction": "Başınızı dik tutun ve karşıya bakın.",
          },
        ],
      },
      {
        "name": "Pelvik Tilt",
        "description":
            "Alt karın kaslarını aktive eder ve bel stabilitesini artırır.",
        "duration": "10-15 tekrar",
        "difficulty": "Başlangıç",
        "category": "Mobilite",
        "imageUrl":
            "https://images.unsplash.com/photo-1518611012118-29a97d9ced41?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Alt Karın", "Bel"],
      },
      {
        "name": "Cat–Cow",
        "description": "Omurganın hareket açıklığını artırır.",
        "duration": "8-12 tekrar",
        "difficulty": "Başlangıç",
        "category": "Mobilite",
        "imageUrl":
            "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Omurga", "Sırt"],
      },
      {
        "name": "Bird Dog",
        "description": "Gövde stabilitesini ve dengeyi geliştirir.",
        "duration": "8-10 tekrar",
        "difficulty": "Başlangıç",
        "category": "Güçlendirme",
        "imageUrl":
            "https://images.unsplash.com/photo-1566241142559-40e1bfc26cc4?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Core", "Denge"],
      },
      {
        "name": "Köprü",
        "description": "Kalça ve bel çevresi kaslarını güçlendirir.",
        "duration": "10-15 tekrar",
        "difficulty": "Başlangıç",
        "category": "Güçlendirme",
        "imageUrl":
            "https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Kalça", "Bel"],
      },
      {
        "name": "Plank (Diz Üstü)",
        "description": "Core kaslarını izometrik olarak çalıştırır.",
        "duration": "15-30 saniye",
        "difficulty": "Başlangıç",
        "category": "Güçlendirme",
        "imageUrl":
            "https://images.unsplash.com/photo-1533038590840-1cfde017e84a?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Core", "Omuz"],
      },
      {
        "name": "Duvar Meleği",
        "description": "Omuz ve üst sırt postürünü iyileştirir.",
        "duration": "10-12 tekrar",
        "difficulty": "Başlangıç",
        "category": "Postür",
        "imageUrl":
            "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=500",
        "videoUrl": "",
        "muscleGroups": ["Omuz", "Üst Sırt"],
      },
    ];

    final batch = _db.batch();
    for (var data in initialExercises) {
      final docRef = _db.collection('exercises').doc();
      batch.set(docRef, data);
    }
    await batch.commit();
  }

  // --- Favorites ---
  Future<void> toggleFavorite(
    String userId,
    String exerciseId,
    bool isFavorite,
  ) async {
    final docRef = _db.collection('favorites').doc(userId);
    if (isFavorite) {
      await docRef.set({
        'exerciseIds': FieldValue.arrayUnion([exerciseId]),
      }, SetOptions(merge: true));
    } else {
      await docRef.set({
        'exerciseIds': FieldValue.arrayRemove([exerciseId]),
      }, SetOptions(merge: true));
    }
  }

  Stream<List<String>> getUserFavorites(String userId) {
    return _db.collection('favorites').doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) return [];
      final data = snapshot.data() as Map<String, dynamic>;
      return List<String>.from(data['exerciseIds'] ?? []);
    });
  }

  Future<List<String>> getFavoritesOnce(String userId) async {
    final doc = await _db.collection('favorites').doc(userId).get();
    if (!doc.exists) return [];
    final data = doc.data() as Map<String, dynamic>;
    return List<String>.from(data['exerciseIds'] ?? []);
  }

  // --- Daily Routines ---
  Future<void> saveDailyRoutine(
    String userId,
    String date,
    List<String> exerciseIds,
  ) async {
    await _db.collection('dailyRoutines').doc('${userId}_$date').set({
      'userId': userId,
      'date': date,
      'exerciseIds': exerciseIds,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<String>?> getDailyRoutine(String userId, String date) async {
    final doc =
        await _db.collection('dailyRoutines').doc('${userId}_$date').get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      return List<String>.from(data['exerciseIds'] ?? []);
    }
    return null;
  }

  // --- Exercise Completion ---
  Future<void> saveExerciseCompletion(
    String userId,
    String exerciseId,
    String date,
  ) async {
    await _db.collection('completions').add({
      'userId': userId,
      'exerciseId': exerciseId,
      'date': date,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
