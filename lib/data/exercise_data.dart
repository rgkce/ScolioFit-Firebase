import '../models/exercise.dart';

class ExerciseData {
  static final List<Exercise> exercises = [
    // --- STRETCHING (ESNEME) ---
    Exercise(
      id: 's1',
      titles: {
        'en': 'Spine Stretch (Cat-Cow)',
        'tr': 'Omurga Esnetme (Kedi-İnek)',
      },
      categories: {'en': 'Stretching', 'tr': 'Esneme'},
      duration: 120,
      descriptions: {
        'en':
            'A gentle flow between two poses that warms up the spine and relieves tension.',
        'tr':
            'Omurgayı yumuşatan, sırt ağrılarını azaltan ve nefesle uyumlu harika bir başlangıç egzersizi.',
      },
      imagePath: 'assets/exercises/cat-cow-pose.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Spine', 'Back', 'Neck'],
        'tr': ['Omurga', 'Sırt', 'Boyun'],
      },
      safetyTipsMap: {
        'en':
            'Keep your movements slow and controlled. Do not strain your neck.',
        'tr':
            'Boynunuzu çok fazla geriye atmayın, hareketleri nefesinizle senkronize edin.',
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Tabletop Position', 'tr': 'Dört Ayak Pozisyonu'},
          instructions: {
            'en':
                'Start on your hands and knees with your wrists under your shoulders and knees under hips.',
            'tr':
                'Ellerini omuzlarının, dizlerini ise kalçalarının tam altına yerleştir. Sırtın bir masa gibi düz olsun. Bakışlarını yere odakla.',
          },
          imageUrl: 'assets/exercises/4-ayak-poz.png',
        ),
        ExerciseStep(
          titles: {'en': 'Cow Pose', 'tr': 'İnek Pozu (Bel Çukuru)'},
          instructions: {
            'en':
                'Inhale, drop your belly toward the mat, lift your chin and chest, looking forward.',
            'tr':
                'Burnundan derin bir nefes alırken karnını nazikçe yere doğru sarkıt. Kalçanı ve göğsünü yukarı kaldır, karşıya bak. Belinde tatlı bir kavis oluşsun.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Cat Pose', 'tr': 'Kedi Pozu (Sırt Kamburu)'},
          instructions: {
            'en':
                'Exhale, pull your belly in and round your back toward the ceiling like a stretching cat.',
            'tr':
                'Nefesini ağzından yavaşça verirken karnını içeri çek ve sırtını bir kedi gibi yukarı doğru yuvarla. Çeneni göğsüne yaklaştır ve göbek deliğine bak.',
          },
        ),
      ],
    ),
    Exercise(
      id: 's2',
      titles: {
        'en': 'Back Relief (Child\'s Pose)',
        'tr': 'Bel Rahatlatma (Çocuk Pozu)',
      },
      categories: {'en': 'Stretching', 'tr': 'Esneme'},
      duration: 120,
      descriptions: {
        'en': 'Restorative pose provides a gentle stretch for back and hips.',
        'tr':
            'Tüm vücudu sakinleştiren, bel ve kalça bölgesindeki gerginliği tamamen boşaltan bir dinlenme pozu.',
      },
      imagePath: 'assets/exercises/childs-pose.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Lower Back', 'Hips', 'Shoulders'],
        'tr': ['Alt Sırt', 'Kalça', 'Omuz'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Preparation', 'tr': 'Hazırlık'},
          instructions: {
            'en':
                'Kneel on the floor. Touch your big toes together and sit on your heels.',
            'tr':
                'Matının üzerine diz çök. Ayak baş parmakların birbirine değsin ama topukların açık kalsın. Topuklarının üzerine rahatça otur.',
          },
          imageUrl: 'assets/exercises/diz-ustu-oturus.png',
        ),
        ExerciseStep(
          titles: {'en': 'Fold Forward', 'tr': 'Öne Katlanma'},
          instructions: {
            'en':
                'Separate your knees, lay your torso down between your thighs. Rest your forehead on the floor.',
            'tr':
                'Ayakta dik dur. Ellerini arkada birleştir, kolları geriye doğru uzat.',
          },
        ),
      ],
    ),
    Exercise(
      id: 's3',
      titles: {'en': 'Chest & Shoulder Opener', 'tr': 'Göğüs ve Omuz Açma'},
      categories: {'en': 'Stretching', 'tr': 'Esneme'},
      duration: 60,
      descriptions: {
        'en':
            'Opens up the chest muscles which often get tight with scoliosis.',
        'tr':
            'Sürekli telefona veya bilgisayara bakmaktan dolayı öne doğru kapanan omuzları ve göğüs kafesini açan çok etkili bir hareket.',
      },
      imagePath: 'assets/exercises/chest-shoulder-opener.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Chest', 'Shoulders'],
        'tr': ['Göğüs', 'Ön Omuz'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Position Arms', 'tr': 'Kolları Yerleştir'},
          instructions: {
            'en':
                'Stand upright. Clasp hands behind the back and extend arms backward.',
            'tr':
                'Bir kapı eşiğinde dur. Kollarını "U" harfi yapacak şekilde kaldır ve ön kollarını kapı çerçevesine yasla. Dirseklerin omuz hizasında olsun.',
          },
        ),
        ExerciseStep(
          titles: {
            'en': 'Open the chest and relaxed',
            'tr': 'Göğsü aç ve Esne',
          },
          instructions: {
            'en': 'Open the chest, keep shoulders relaxed. Hold for 5 seconds.',
            'tr': 'Göğsü aç, omuzları aşağıda tut. 5 sn tut.',
          },
        ),
      ],
    ),
    Exercise(
      id: 's4',
      titles: {'en': 'Postural Lift (Sphinx)', 'tr': 'Dik Duruş Pozu (Sfenks)'},
      categories: {'en': 'Stretching', 'tr': 'Esneme'},
      duration: 180,
      descriptions: {
        'en': 'Gentle backbend to help counteract forward slouching.',
        'tr':
            'Belin alt kısmını güçlendiren ve göğsü yukarı kaldırarak dik duruşu destekleyen, yatarak yapılan bir esneme.',
      },
      imagePath: 'assets/exercises/sphinx-pose.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Lower Back', 'Spine', 'Abs'],
        'tr': ['Bel', 'Omurga', 'Karın'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Lie Face Down', 'tr': 'Yüzüstü Uzan'},
          instructions: {
            'en':
                'Lie on your stomach with your legs straight behind you, feet tops on the floor.',
            'tr':
                'Karnının üzerine uzan. Bacaklarını kalça genişliğinde aç ve ayaklarının üstünü yere bastır.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Lift to Forearms', 'tr': 'Dirseklerinle Yüksel'},
          instructions: {
            'en':
                'Prop yourself up on your forearms. Keep elbows directly under your shoulders, chest lifted.',
            'tr':
                'Ön kollarını yere koy ve kendini yukarı kaldır. Dirseklerin tam omuzlarının altında olsun. Omuzlarını kulaklarından uzaklaştır.',
          },
        ),
      ],
    ),
    Exercise(
      id: 's5',
      titles: {'en': 'Hip Stretch (Pigeon)', 'tr': 'Kalça Esnetme (Güvercin)'},
      categories: {'en': 'Stretching', 'tr': 'Esneme'},
      duration: 120,
      descriptions: {
        'en': 'Deep hip opener that helps relieve tension in the lower back.',
        'tr':
            'Alt sırttaki gerginliği hafifletmeye yardımcı olan derin kalça açıcı.',
      },
      imagePath: 'assets/exercises/pigeon-pose.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Hips', 'Glutes', 'Lower Back'],
        'tr': ['Kalça', 'Glutlar', 'Alt Sırt'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç Pozisyonu'},
          instructions: {
            'en':
                'Start in tabletop position with hands under shoulders and knees under hips.',
            'tr':
                'Dört ayak pozisyonunda başla. Ellerini omuzlarının, dizlerini kalçalarının altına yerleştir.',
          },
          imageUrl: 'assets/exercises/4-ayak-poz.png',
        ),
        ExerciseStep(
          titles: {'en': 'Right Side', 'tr': 'Sağ Taraf'},
          instructions: {
            'en':
                'Bring right knee forward and place it in front of right ankle. Extend left leg back. Lower hips toward floor and hold for 30 seconds.',
            'tr':
                'Sağ dizinizi öne getir ve sağ bileğinin önüne yerleştir. Sol bacağını arkaya doğru uzat. Kalçalarını yere doğru indir ve 30 saniye tut.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Left Side', 'tr': 'Sol Taraf'},
          instructions: {
            'en':
                'Switch sides. Bring left knee forward and place it in front of left ankle. Extend right leg back. Lower hips toward floor and hold for 30 seconds.',
            'tr':
                'Tarafları değiştir. Sol dizini öne getir ve sol bileğinin önüne yerleştir. Sağ bacağını arkaya doğru uzat. Kalçalarını yere doğru indir ve 30 saniye tut.',
          },
        ),
      ],
    ),

    // --- STRENGTH (KUVVET) ---
    Exercise(
      id: 'st1',
      titles: {
        'en': 'Core Stability (Plank)',
        'tr': 'Karın Güçlendirme (Plank)',
      },
      categories: {'en': 'Strength', 'tr': 'Kuvvet'},
      duration: 60,
      descriptions: {
        'en': 'Fundamental core strength exercise for internal stability.',
        'tr':
            'Vücudun tüm merkez bölgesini (core) çelik gibi yapan, dik duruşun en büyük dostu olan kuvvet egzersizi.',
      },
      imagePath: 'assets/exercises/plank.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Core', 'Lower Back', 'Shoulders'],
        'tr': ['Karın', 'Bel', 'Omuz'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Forearm Position', 'tr': 'Ön Kol Üstünde Duruş'},
          instructions: {
            'en':
                'Lie face down. Put elbows under shoulders. Keep forearms parallel and tuck your toes.',
            'tr':
                'Yüzüstü uzanırken dirseklerini tam omuzlarının altına yerleştir. Ön kolların paralel olsun. Ayak parmaklarını yere tak.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Lift Body', 'tr': 'Vücudu Kaldır'},
          instructions: {
            'en':
                'Squeeze your abs and glutes to lift your body. Maintain a straight line from head to heels.',
            'tr':
                'Karnını ve kalçanı sıkarak tüm vücudunu yerden kaldır. Başından topuklarına kadar dümdüz bir çizgi oluştur.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'st2',
      titles: {
        'en': 'Oblique Power (Side Plank)',
        'tr': 'Yan Karın (Side Plank)',
      },
      categories: {'en': 'Strength', 'tr': 'Kuvvet'},
      duration: 60,
      descriptions: {
        'en': 'Excellent for lateral stability and obliques.',
        'tr': 'Yanal stabilite ve oblikler için mükemmel.',
      },
      imagePath: 'assets/exercises/side-plank.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Obliques', 'Core'],
        'tr': ['Oblikler', 'Karın'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Right Side', 'tr': 'Sağ Taraf'},
          instructions: {
            'en':
                'Lie on your right side. Place right elbow directly under shoulder. Prop yourself up on right forearm and lift hips off ground. Keep body in straight line. Hold for 30 seconds.',
            'tr':
                'Sağ tarafına uzan. Sağ dirseğini omzunun tam altına koy. Sağ ön kolunla destek alarak kalçanı yerden kaldır. Vücudun düz bir çizgi oluştursun. 30 saniye tut.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Left Side', 'tr': 'Sol Taraf'},
          instructions: {
            'en':
                'Lie on your left side. Place left elbow directly under shoulder. Prop yourself up on left forearm and lift hips off ground. Keep body in straight line. Hold for 30 seconds.',
            'tr':
                'Sol tarafına uzan. Sol dirseğini omzunun tam altına koy. Sol ön kolunla destek alarak kalçanı yerden kaldır. Vücudun düz bir çizgi oluştursun. 30 saniye tut.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'st3',
      titles: {
        'en': 'Balance Flow (Bird Dog)',
        'tr': 'Çapraz Denge (Bird Dog)',
      },
      categories: {'en': 'Strength', 'tr': 'Kuvvet'},
      duration: 180,
      descriptions: {
        'en': 'Core stability exercise that improves balance and posture.',
        'tr': 'Dengeyi ve duruşu geliştiren karın stabilitesi egzersizi.',
      },
      imagePath: 'assets/exercises/bird-dog.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Core', 'Glutes'],
        'tr': ['Karın', 'Glutlar'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç'},
          instructions: {
            'en':
                'Start in tabletop position with hands under shoulders and knees under hips. Keep back straight.',
            'tr':
                'Dört ayak pozisyonunda başla. Ellerini omuzlarının, dizlerini kalçalarının altına yerleştir. Sırtını düz tut.',
          },
          imageUrl: 'assets/exercises/4-ayak-poz.png',
        ),
        ExerciseStep(
          titles: {'en': 'Right Arm - Left Leg', 'tr': 'Sağ Kol - Sol Bacak'},
          instructions: {
            'en':
                'Extend right arm forward (ear level). Simultaneously extend left leg back (hip level). Maintain balance and hold for 10 seconds. Slowly return to starting position.',
            'tr':
                'Sağ kolunu öne doğru uzat (kulak hizasında). Aynı anda sol bacağını arkaya doğru uzat (kalça hizasında). Dengeyi koru ve 10 saniye tut. Yavaşça başlangıç pozisyonuna dön.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Left Arm - Right Leg', 'tr': 'Sol Kol - Sağ Bacak'},
          instructions: {
            'en':
                'Extend left arm forward (ear level). Simultaneously extend right leg back (hip level). Maintain balance and hold for 10 seconds. Slowly return to starting position. Alternate sides and repeat.',
            'tr':
                'Sol kolunu öne doğru uzat (kulak hizasında). Aynı anda sağ bacağını arkaya doğru uzat (kalça hizasında). Dengeyi koru ve 10 saniye tut. Yavaşça başlangıç pozisyonuna dön. Tarafları değiştirerek tekrarla.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'st4',
      titles: {'en': 'Glute Bridge', 'tr': 'Kalça Köprüsü'},
      categories: {'en': 'Strength', 'tr': 'Kuvvet'},
      duration: 120,
      descriptions: {
        'en':
            'Strengthens the glutes and hamstrings to support the lower back.',
        'tr':
            'Kalça kaslarını ateşleyen ve bel bölgesine binen yükü azaltarak omurgayı destekleyen temel hareket.',
      },
      imagePath: 'assets/exercises/glute-bridge.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Glutes', 'Hamstrings', 'Lower Back'],
        'tr': ['Kalça', 'Arka Bacak', 'Bel'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç Pozisyonu'},
          instructions: {
            'en':
                'Lie on your back. Bend knees and plant feet firmly on floor (hip-width apart). Place arms at sides, palms facing down.',
            'tr':
                'Sırt üstü uzan. Dizlerini bük ve ayaklarını yere sağlam bas (kalça genişliğinde). Kollarını yanlarına koy, avuç içleri yere baksın.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Lift Hips', 'tr': 'Kalçayı Kaldır'},
          instructions: {
            'en':
                'Drive through your heels to lift hips toward ceiling. Create a straight line from shoulders to knees. Squeeze glutes at top for 2-3 seconds, then slowly lower. Repeat 10-15 times.',
            'tr':
                'Topuklarından güç alarak kalçanı yukarıya doğru kaldır. Omuzlarından dizlerine kadar düz bir çizgi oluştur. Yukarıda kalçanı 2-3 saniye sıkarak tut, sonra yavaşça indir. 10-15 kez tekrarla.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'st5',
      titles: {'en': 'Back & Spine Power', 'tr': 'Sırt ve Bel Güçlendirme'},
      categories: {'en': 'Strength', 'tr': 'Kuvvet'},
      duration: 120,
      descriptions: {
        'en':
            'Strengthens the entire posterior chain, especially the erector spinae.',
        'tr': 'Tüm arka zinciri, özellikle de erektör spinaları güçlendirir.',
      },
      imagePath: 'assets/exercises/back-spine-power.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Lower Back', 'Glutes', 'Shoulders'],
        'tr': ['Alt Sırt', 'Glutlar', 'Omuz'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç Pozisyonu'},
          instructions: {
            'en':
                'Lie face down. Extend arms overhead in front of you. Keep legs straight, toes pointing down.',
            'tr':
                'Yüzüstü uzan. Kollarını başının üzerinde öne doğru uzat. Bacaklarını düz tut, ayak parmakları yere baksın.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Lifting Movement', 'tr': 'Kaldırma Hareketi'},
          instructions: {
            'en':
                'Take a deep breath. As you exhale, simultaneously lift arms, chest, and legs off floor. Only belly should touch ground. Hold for 3-5 seconds, then slowly lower. Repeat 10 times.',
            'tr':
                'Derin bir nefes al. Nefes verirken aynı anda kollarını, göğsünü ve bacaklarını yerden kaldır. Sadece karnın yerde kalsın. 3-5 saniye tut, sonra yavaşça indir. 10 kez tekrarla.',
          },
        ),
      ],
    ),

    // --- MOBILITY (MOBİLİTE) ---
    Exercise(
      id: 'm1',
      titles: {'en': 'Shoulder Flow (Wall)', 'tr': 'Omuz Mobilite (Duvar)'},
      categories: {'en': 'Mobility', 'tr': 'Mobilite'},
      duration: 180,
      descriptions: {
        'en': 'Improves shoulder mobility and upper back posture.',
        'tr':
            'Omuzların hareket kabiliyetini artıran ve kambur duruşu (kifoz) düzeltmeye yardımcı olan harika bir mobilite hareketi.',
      },
      imagePath: 'assets/exercises/omuz-germe.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Upper Back', 'Shoulders', 'Scapula'],
        'tr': ['Üst Sırt', 'Omuzlar', 'Kürek Kemikleri'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç Pozisyonu'},
          instructions: {
            'en':
                'Stand facing a wall. Place hands on the wall and lean forward slightly.',
            'tr':
                'Duvara dönük ayakta dur. Elleri duvara koy, göğsü öne yaklaştır.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Slide Up', 'tr': 'Yukarı Kaydırma'},
          instructions: {
            'en':
                'Gently open the shoulders. Hold for 10 seconds and then slowly return to starting position. ',
            'tr':
                'Omuzları yumuşakça aç. 10 sn tutup sonra yavaşça başlangıç pozisyonuna dön.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'm2',
      titles: {'en': 'T-Spine Bridge', 'tr': 'Göğüs ve Sırt Köprüsü'},
      categories: {'en': 'Mobility', 'tr': 'Mobilite'},
      duration: 240,
      descriptions: {
        'en': 'Dynamic movement to improve spinal rotation.',
        'tr': 'Omurga rotasyonunu geliştirmek için dinamik hareket.',
      },
      imagePath: 'assets/exercises/t-spine-bridge.png',
      difficulties: {'en': 'Advanced', 'tr': 'İleri'},
      muscleGroupsMap: {
        'en': ['Shoulders', 'Core', 'Back'],
        'tr': ['Omuzlar', 'Karın', 'Sırt'],
      },
      steps: [
        ExerciseStep(
          titles: {
            'en': 'Starting - Bridge Position',
            'tr': 'Başlangıç - Köprü Pozisyonu',
          },
          instructions: {
            'en':
                'Lie on back, bend knees, plant feet on floor. Lift hips into bridge position. Create straight line from shoulders to knees.',
            'tr':
                'Sırt üstü uzan, dizlerini bük, ayaklarını yere bas. Kalçanı kaldırarak köprü pozisyonuna geç. Omuzlarından dizlerine kadar düz bir çizgi oluştur.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Right Arm Reach', 'tr': 'Sağ Kol Uzatma'},
          instructions: {
            'en':
                'While in bridge position, reach right arm overhead and back. Push hips even higher. Hold for 5 seconds, then lower arm.',
            'tr':
                'Köprü pozisyonunda kalırken sağ kolunu başının üzerinden arkaya doğru uzat. Kalçanı daha da yukarı it. 5 saniye tut, sonra kolu indir.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Left Arm Reach', 'tr': 'Sol Kol Uzatma'},
          instructions: {
            'en':
                'While in bridge position, reach left arm overhead and back. Push hips even higher. Hold for 5 seconds, then lower arm. Repeat both sides 5-8 times.',
            'tr':
                'Köprü pozisyonunda kalırken sol kolunu başının üzerinden arkaya doğru uzat. Kalçanı daha da yukarı it. 5 saniye tut, sonra kolu indir. Her iki tarafı 5-8 kez tekrarla.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'm3',
      titles: {'en': 'Spinal Rotation', 'tr': 'Omurga Rotasyonu'},
      categories: {'en': 'Mobility', 'tr': 'Mobilite'},
      duration: 120,
      descriptions: {
        'en': 'Increases the range of motion in the thoracic spine.',
        'tr': 'Torasik omurgadaki hareket aralığını artırır.',
      },
      imagePath: 'assets/exercises/spinal-rotation.png',
      difficulties: {'en': 'Beginner', 'tr': 'Başlangıç'},
      muscleGroupsMap: {
        'en': ['Thoracic Spine', 'Obliques'],
        'tr': ['Torasik Omurga', 'Oblikler'],
      },
      steps: [
        ExerciseStep(
          titles: {'en': 'Starting Position', 'tr': 'Başlangıç Pozisyonu'},
          instructions: {
            'en':
                'Lie on right side. Bend knees (90 degrees). Bring arms together in front, palms facing each other.',
            'tr':
                'Sağ tarafına uzan. Dizlerini bük (90 derece). Kollarını önünde birleştir, avuç içleri birbirine baksın.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Left Arm Rotation', 'tr': 'Sol Kol Rotasyonu'},
          instructions: {
            'en':
                'Keeping knees on ground, open left arm to left side like opening a book. Turn head with arm. Open as far as possible and hold for 3 seconds. Return to start. Repeat 8-10 times.',
            'tr':
                'Dizlerini yerde tutarak sol kolunu bir kitap açar gibi sol tarafa doğru aç. Başını da kolla birlikte çevir. Mümkün olduğunca aç ve 3 saniye tut. Başlangıç pozisyonuna dön. 8-10 kez tekrarla.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Switch Sides', 'tr': 'Taraf Değiştir'},
          instructions: {
            'en':
                'Lie on left side and repeat same movement with right arm. Open right arm to right side, hold for 3 seconds. Repeat 8-10 times.',
            'tr':
                'Sol tarafına uzan ve aynı hareketi sağ kolla tekrarla. Sağ kolunu sağ tarafa doğru aç, 3 saniye tut. 8-10 kez tekrarla.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'm4',
      titles: {'en': 'Squat & Reach', 'tr': 'Çökme ve Uzanma'},
      categories: {'en': 'Mobility', 'tr': 'Mobilite'},
      duration: 180,
      descriptions: {
        'en': 'Combines lower body mobility with thoracic opening.',
        'tr': 'Alt vücut mobilitesini torasik açılma ile birleştirir.',
      },
      imagePath: 'assets/exercises/squat-reach.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Hips', 'Spine', 'Shoulders'],
        'tr': ['Kalça', 'Omurga', 'Omuz'],
      },
      steps: [
        ExerciseStep(
          titles: {
            'en': 'Starting - Deep Squat',
            'tr': 'Başlangıç - Derin Çömelme',
          },
          instructions: {
            'en': 'Drop into a squat.',
            'tr': 'Çömelme pozisyonu al.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Reach', 'tr': 'Uzanma'},
          instructions: {
            'en':
                'Stand up while reaching arms overhead. Return smoothly to squat. Repeat 10-15 times',
            'tr':
                'Ayağa kalkarken kolları yukarı uzat. Akıcı şekilde tekrar çömel. 10-15 kez tekrarla.',
          },
        ),
      ],
    ),
    Exercise(
      id: 'm5',
      titles: {'en': 'Total Body Flow', 'tr': 'Tam Vücut Mobilite'},
      categories: {'en': 'Mobility', 'tr': 'Mobilite'},
      duration: 300,
      descriptions: {
        'en': 'A comprehensive flow to mobilize the entire body.',
        'tr': 'Tüm vücudu mobilize etmek için kapsamlı bir akış.',
      },
      imagePath: 'assets/exercises/total-body-flow.png',
      difficulties: {'en': 'Intermediate', 'tr': 'Orta'},
      muscleGroupsMap: {
        'en': ['Hips', 'Tspine', 'Hamstrings'],
        'tr': ['Kalça', 'T-Omurga', 'Hamstringler'],
      },
      steps: [
        ExerciseStep(
          titles: {
            'en': 'Starting - Lunge Position',
            'tr': 'Başlangıç - Hamle Pozisyonu',
          },
          instructions: {
            'en':
                'Step right foot forward into deep lunge position. Place left knee on ground. Place hands on either side of right foot.',
            'tr':
                'Sağ ayağını öne at, derin bir hamle pozisyonuna geç. Sol dizini yere koy. Ellerini sağ ayağının iki yanına yerleştir.',
          },
        ),
        ExerciseStep(
          titles: {
            'en': 'Elbow-to-Ankle Movement',
            'tr': 'Dirsek-Bilek Hareketi',
          },
          instructions: {
            'en':
                'Lower left elbow toward right ankle. Push hips down and feel the stretch. Hold for 2 seconds.',
            'tr':
                'Sol dirseğini sağ ayak bileğine doğru indir. Kalçanı aşağı it ve esnemeyi hisset. 2 saniye tut.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Rotation and Reach', 'tr': 'Rotasyon ve Uzanma'},
          instructions: {
            'en':
                'Reach left arm toward ceiling and rotate torso to left. Open chest. Hold for 2 seconds. Return to start. Repeat 5 times.',
            'tr':
                'Sol kolunu tavana doğru uzat ve gövdeni sola doğru döndür. Göğsünü aç. 2 saniye tut. Başlangıç pozisyonuna dön. 5 kez tekrarla.',
          },
        ),
        ExerciseStep(
          titles: {'en': 'Switch Sides', 'tr': 'Taraf Değiştir'},
          instructions: {
            'en':
                'Step left foot forward and repeat entire movement on other side. Lower right elbow toward left ankle, then reach right arm up. Complete both sides.',
            'tr':
                'Sol ayağını öne al ve tüm hareketi diğer tarafla tekrarla. Sağ dirseği sol bilek yönüne indir, sonra sağ kolu yukarı uzat. Her iki tarafı tamamla.',
          },
        ),
      ],
    ),
  ];
}
