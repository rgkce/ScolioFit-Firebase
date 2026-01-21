import '../models/exercise.dart';
import '../models/category.dart';

class MockExerciseData {
  static List<Category> getCategories(String lang) {
    if (lang == 'tr') {
      return [
        Category(
          id: '1',
          name: 'Esneme',
          icon: 'accessibility',
          description: 'Esneklik ve uzama.',
        ),
        Category(
          id: '2',
          name: 'Kuvvet',
          icon: 'fitness_center',
          description: 'Kas yapımı ve destek.',
        ),
        Category(
          id: '3',
          name: 'Mobilite',
          icon: 'directions_run',
          description: 'Hareket aralığı ve akış.',
        ),
      ];
    }
    return [
      Category(
        id: '1',
        name: 'Stretching',
        icon: 'accessibility',
        description: 'Flexibility and lengthening.',
      ),
      Category(
        id: '2',
        name: 'Strength',
        icon: 'fitness_center',
        description: 'Building muscle and support.',
      ),
      Category(
        id: '3',
        name: 'Mobility',
        icon: 'directions_run',
        description: 'Range of motion and flow.',
      ),
    ];
  }

  static List<Exercise> getExercises(String lang) {
    bool isTr = lang == 'tr';

    return [
      // --- STRETCHING ---
      Exercise(
        id: 's1',
        name: isTr ? 'Omurga Esnetme (Kedi-İnek)' : 'Spine Stretch (Cat-Cow)',
        description:
            isTr
                ? 'Omurgayı yumuşatan, sırt ağrılarını azaltan ve nefesle uyumlu harika bir başlangıç egzersizi.'
                : 'A gentle flow between two poses that warms up the spine and relieves tension.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Esneme' : 'Stretching',
        imageUrl: 'assets/exercises/cat-cow-pose.png',
        videoUrl: '',
        muscleGroups:
            isTr ? ['Omurga', 'Sırt', 'Boyun'] : ['Spine', 'Back', 'Neck'],
        safetyTips:
            isTr
                ? 'Boynunuzu çok fazla geriye atmayın, hareketleri nefesinizle senkronize edin.'
                : 'Keep your movements slow and controlled. Do not strain your neck.',
        steps: [
          ExerciseStep(
            title: isTr ? 'Dört Ayak Pozisyonu' : 'Tabletop Position',
            instruction:
                isTr
                    ? 'Ellerini omuzlarının, dizlerini ise kalçalarının tam altına yerleştir. Sırtın bir masa gibi düz olsun. Bakışlarını yere odakla.'
                    : 'Start on your hands and knees with your wrists under your shoulders and knees under hips.',
            imageUrl: 'assets/exercises/4-ayak-poz.png',
          ),
          ExerciseStep(
            title: isTr ? 'İnek Pozu (Bel Çukuru)' : 'Cow Pose',
            instruction:
                isTr
                    ? 'Burnundan derin bir nefes alırken karnını nazikçe yere doğru sarkıt. Kalçanı ve göğsünü yukarı kaldır, karşıya bak. Belinde tatlı bir kavis oluşsun.'
                    : 'Inhale, drop your belly toward the mat, lift your chin and chest, looking forward.',
          ),
          ExerciseStep(
            title: isTr ? 'Kedi Pozu (Sırt Kamburu)' : 'Cat Pose',
            instruction:
                isTr
                    ? 'Nefesini ağzından yavaşça verirken karnını içeri çek ve sırtını bir kedi gibi yukarı doğru yuvarla. Çeneni göğsüne yaklaştır ve göbek deliğine bak.'
                    : 'Exhale, pull your belly in and round your back toward the ceiling like a stretching cat.',
          ),
        ],
      ),
      Exercise(
        id: 's2',
        name:
            isTr
                ? 'Bel Rahatlatma (Çocuk Pozu)'
                : 'Back Relief (Child\'s Pose)',
        description:
            isTr
                ? 'Tüm vücudu sakinleştiren, bel ve kalça bölgesindeki gerginliği tamamen boşaltan bir dinlenme pozu.'
                : 'Restorative pose provides a gentle stretch for back and hips.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Esneme' : 'Stretching',
        imageUrl: 'assets/exercises/childs-pose.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Alt Sırt', 'Kalça', 'Omuz']
                : ['Lower Back', 'Hips', 'Shoulders'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Hazırlık' : 'Preparation',
            instruction:
                isTr
                    ? 'Matının üzerine diz çök. Ayak baş parmakların birbirine değsin ama topukların açık kalsın. Topuklarının üzerine rahatça otur.'
                    : 'Kneel on the floor. Touch your big toes together and sit on your heels.',
            imageUrl:
                'https://images.unsplash.com/photo-1510894347713-fc3ad6cb0d0d?q=80&w=400',
          ),
          ExerciseStep(
            title: isTr ? 'Öne Katlanma' : 'Fold Forward',
            instruction:
                isTr
                    ? 'Dizlerini hafifçe yanlara aç. Nefes verirken gövdeni bacaklarının arasına doğru yavaşça indir. Alnını yere koy ve kollarını ileriye doğru uzunca uzat.'
                    : 'Separate your knees, lay your torso down between your thighs. Rest your forehead on the floor.',
          ),
        ],
      ),
      Exercise(
        id: 's3',
        name: isTr ? 'Göğüs ve Omuz Açma' : 'Chest & Shoulder Opener',
        description:
            isTr
                ? 'Sürekli telefona veya bilgisayara bakmaktan dolayı öne doğru kapanan omuzları ve göğüs kafesini açan çok etkili bir hareket.'
                : 'Opens up the chest muscles which often get tight with scoliosis.',
        duration: isTr ? '1 dk' : '1 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Esneme' : 'Stretching',
        imageUrl: 'assets/exercises/chest-shoulder-opener.png',
        videoUrl: '',
        muscleGroups: isTr ? ['Göğüs', 'Ön Omuz'] : ['Chest', 'Shoulders'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Kolları Yerleştir' : 'Position Arms',
            instruction:
                isTr
                    ? 'Bir kapı eşiğinde dur. Kollarını "U" harfi yapacak şekilde kaldır ve ön kollarını kapı çerçevesine yasla. Dirseklerin omuz hizasında olsun.'
                    : 'Stand in a doorway. Raise your arms in a "U" shape and place forearms on the doorframe.',
          ),
          ExerciseStep(
            title: isTr ? 'Adım At ve Esne' : 'Lean Forward',
            instruction:
                isTr
                    ? 'Bir ayağınla öne doğru küçük bir adım at. Göğsünde ve omuzlarında nazik bir gerilme hissedene kadar vücut ağırlığını yavaşça öne ver.'
                    : 'Step forward with one foot. Slowly lean your body weight forward until you feel a stretch.',
          ),
        ],
      ),
      Exercise(
        id: 's4',
        name: isTr ? 'Dik Duruş Pozu (Sfenks)' : 'Postural Lift (Sphinx)',
        description:
            isTr
                ? 'Belin alt kısmını güçlendiren ve göğsü yukarı kaldırarak dik duruşu destekleyen, yatarak yapılan bir esneme.'
                : 'Gentle backbend to help counteract forward slouching.',
        duration: isTr ? '3 dk' : '3 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Esneme' : 'Stretching',
        imageUrl: 'assets/exercises/sphinx-pose.png',
        videoUrl: '',
        muscleGroups:
            isTr ? ['Bel', 'Omurga', 'Karın'] : ['Lower Back', 'Spine', 'Abs'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Yüzüstü Uzan' : 'Lie Face Down',
            instruction:
                isTr
                    ? 'Karnının üzerine uzan. Bacaklarını kalça genişliğinde aç ve ayaklarının üstünü yere bastır.'
                    : 'Lie on your stomach with your legs straight behind you, feet tops on the floor.',
          ),
          ExerciseStep(
            title: isTr ? 'Dirseklerinle Yüksel' : 'Lift to Forearms',
            instruction:
                isTr
                    ? 'Ön kollarını yere koy ve kendini yukarı kaldır. Dirseklerin tam omuzlarının altında olsun. Omuzlarını kulaklarından uzaklaştır.'
                    : 'Prop yourself up on your forearms. Keep elbows directly under your shoulders, chest lifted.',
          ),
        ],
      ),
      Exercise(
        id: 's5',
        name: isTr ? 'Kalça Esnetme (Güvercin)' : 'Hip Stretch (Pigeon)',
        description:
            isTr
                ? 'Alt sırttaki gerginliği hafifletmeye yardımcı olan derin kalça açıcı.'
                : 'Deep hip opener that helps relieve tension in the lower back.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Esneme' : 'Stretching',
        imageUrl: 'assets/exercises/pigeon-pose.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Kalça', 'Glutlar', 'Alt Sırt']
                : ['Hips', 'Glutes', 'Lower Back'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç Pozisyonu' : 'Starting Position',
            instruction:
                isTr
                    ? 'Dört ayak pozisyonunda başla. Ellerini omuzlarının, dizlerini kalçalarının altına yerleştir.'
                    : 'Start in tabletop position with hands under shoulders and knees under hips.',
          ),
          ExerciseStep(
            title: isTr ? 'Sağ Taraf' : 'Right Side',
            instruction:
                isTr
                    ? 'Sağ dizini öne getir ve sağ bileğinin önüne yerleştir. Sol bacağını arkaya doğru uzat. Kalçalarını yere doğru indir ve 30 saniye tut.'
                    : 'Bring right knee forward and place it in front of right ankle. Extend left leg back. Lower hips toward floor and hold for 30 seconds.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Taraf' : 'Left Side',
            instruction:
                isTr
                    ? 'Tarafları değiştir. Sol dizini öne getir ve sol bileğinin önüne yerleştir. Sağ bacağını arkaya doğru uzat. Kalçalarını yere doğru indir ve 30 saniye tut.'
                    : 'Switch sides. Bring left knee forward and place it in front of left ankle. Extend right leg back. Lower hips toward floor and hold for 30 seconds.',
          ),
        ],
      ),
      Exercise(
        id: 'st1',
        name: isTr ? 'Karın Güçlendirme (Plank)' : 'Core Stability (Plank)',
        description:
            isTr
                ? 'Vücudun tüm merkez bölgesini (core) çelik gibi yapan, dik duruşun en büyük dostu olan kuvvet egzersizi.'
                : 'Fundamental core strength exercise for internal stability.',
        duration: isTr ? '1 dk' : '1 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Kuvvet' : 'Strength',
        imageUrl: 'assets/exercises/plank.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Karın', 'Bel', 'Omuz']
                : ['Core', 'Lower Back', 'Shoulders'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Ön Kol Üstünde Duruş' : 'Forearm Position',
            instruction:
                isTr
                    ? 'Yüzüstü uzanırken dirseklerini tam omuzlarının altına yerleştir. Ön kolların paralel olsun. Ayak parmaklarını yere tak.'
                    : 'Lie face down. Put elbows under shoulders. Keep forearms parallel and tuck your toes.',
          ),
          ExerciseStep(
            title: isTr ? 'Vücudu Kaldır' : 'Lift Body',
            instruction:
                isTr
                    ? 'Karnını ve kalçanı sıkarak tüm vücudunu yerden kaldır. Başından topuklarına kadar dümdüz bir çizgi oluştur.'
                    : 'Squeeze your abs and glutes to lift your body. Maintain a straight line from head to heels.',
          ),
        ],
      ),
      Exercise(
        id: 'st2',
        name: isTr ? 'Yan Karın (Side Plank)' : 'Oblique Power (Side Plank)',
        description:
            isTr
                ? 'Yanal stabilite ve oblikler için mükemmel.'
                : 'Excellent for lateral stability and obliques.',
        duration: isTr ? '1 dk' : '1 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Kuvvet' : 'Strength',
        imageUrl: 'assets/exercises/side-plank.png',
        videoUrl: '',
        muscleGroups: isTr ? ['Oblikler', 'Karın'] : ['Obliques', 'Core'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Sağ Taraf' : 'Right Side',
            instruction:
                isTr
                    ? 'Sağ tarafına uzan. Sağ dirseğini omzunun tam altına koy. Sağ ön kolunla destek alarak kalçanı yerden kaldır. Vücudun düz bir çizgi oluştursun. 30 saniye tut.'
                    : 'Lie on your right side. Place right elbow directly under shoulder. Prop yourself up on right forearm and lift hips off ground. Keep body in straight line. Hold for 30 seconds.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Taraf' : 'Left Side',
            instruction:
                isTr
                    ? 'Sol tarafına uzan. Sol dirseğini omzunun tam altına koy. Sol ön kolunla destek alarak kalçanı yerden kaldır. Vücudun düz bir çizgi oluştursun. 30 saniye tut.'
                    : 'Lie on your left side. Place left elbow directly under shoulder. Prop yourself up on left forearm and lift hips off ground. Keep body in straight line. Hold for 30 seconds.',
          ),
        ],
      ),
      Exercise(
        id: 'st3',
        name: isTr ? 'Çapraz Denge (Bird Dog)' : 'Balance Flow (Bird Dog)',
        description:
            isTr
                ? 'Dengeyi ve duruşu geliştiren karın stabilitesi egzersizi.'
                : 'Core stability exercise that improves balance and posture.',
        duration: isTr ? '3 dk' : '3 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Kuvvet' : 'Strength',
        imageUrl: 'assets/exercises/bird-dog.png',
        videoUrl: '',
        muscleGroups: isTr ? ['Karın', 'Glutlar'] : ['Core', 'Glutes'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç' : 'Starting Position',
            instruction:
                isTr
                    ? 'Dört ayak pozisyonunda başla. Ellerini omuzlarının, dizlerini kalçalarının altına yerleştir. Sırtını düz tut.'
                    : 'Start in tabletop position with hands under shoulders and knees under hips. Keep back straight.',
          ),
          ExerciseStep(
            title: isTr ? 'Sağ Kol - Sol Bacak' : 'Right Arm - Left Leg',
            instruction:
                isTr
                    ? 'Sağ kolunu öne doğru uzat (kulak hizasında). Aynı anda sol bacağını arkaya doğru uzat (kalça hizasında). Dengeyi koru ve 10 saniye tut. Yavaşça başlangıç pozisyonuna dön.'
                    : 'Extend right arm forward (ear level). Simultaneously extend left leg back (hip level). Maintain balance and hold for 10 seconds. Slowly return to starting position.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Kol - Sağ Bacak' : 'Left Arm - Right Leg',
            instruction:
                isTr
                    ? 'Sol kolunu öne doğru uzat (kulak hizasında). Aynı anda sağ bacağını arkaya doğru uzat (kalça hizasında). Dengeyi koru ve 10 saniye tut. Yavaşça başlangıç pozisyonuna dön. Tarafları değiştirerek tekrarla.'
                    : 'Extend left arm forward (ear level). Simultaneously extend right leg back (hip level). Maintain balance and hold for 10 seconds. Slowly return to starting position. Alternate sides and repeat.',
          ),
        ],
      ),
      Exercise(
        id: 'st4',
        name: isTr ? 'Kalça Köprüsü' : 'Glute Bridge',
        description:
            isTr
                ? 'Kalça kaslarını ateşleyen ve bel bölgesine binen yükü azaltarak omurgayı destekleyen temel hareket.'
                : 'Strengthens the glutes and hamstrings to support the lower back.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Kuvvet' : 'Strength',
        imageUrl: 'assets/exercises/glute-bridge.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Kalça', 'Arka Bacak', 'Bel']
                : ['Glutes', 'Hamstrings', 'Lower Back'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç Pozisyonu' : 'Starting Position',
            instruction:
                isTr
                    ? 'Sırt üstü uzan. Dizlerini bük ve ayaklarını yere sağlam bas (kalça genişliğinde). Kollarını yanlarına koy, avuç içleri yere baksın.'
                    : 'Lie on your back. Bend knees and plant feet firmly on floor (hip-width apart). Place arms at sides, palms facing down.',
          ),
          ExerciseStep(
            title: isTr ? 'Kalçayı Kaldır' : 'Lift Hips',
            instruction:
                isTr
                    ? 'Topuklarından güç alarak kalçanı yukarıya doğru kaldır. Omuzlarından dizlerine kadar düz bir çizgi oluştur. Yukarıda kalçanı 2-3 saniye sıkarak tut, sonra yavaşça indir. 10-15 kez tekrarla.'
                    : 'Drive through your heels to lift hips toward ceiling. Create a straight line from shoulders to knees. Squeeze glutes at top for 2-3 seconds, then slowly lower. Repeat 10-15 times.',
          ),
        ],
      ),
      Exercise(
        id: 'st5',
        name: isTr ? 'Sırt ve Bel Güçlendirme' : 'Back & Spine Power',
        description:
            isTr
                ? 'Tüm arka zinciri, özellikle de erektör spinaları güçlendirir.'
                : 'Strengthens the entire posterior chain, especially the erector spinae.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Kuvvet' : 'Strength',
        imageUrl: 'assets/exercises/back-spine-power.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Alt Sırt', 'Glutlar', 'Omuz']
                : ['Lower Back', 'Glutes', 'Shoulders'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç Pozisyonu' : 'Starting Position',
            instruction:
                isTr
                    ? 'Yüzüstü uzan. Kollarını başının üzerinde öne doğru uzat. Bacaklarını düz tut, ayak parmakları yere baksın.'
                    : 'Lie face down. Extend arms overhead in front of you. Keep legs straight, toes pointing down.',
          ),
          ExerciseStep(
            title: isTr ? 'Kaldırma Hareketi' : 'Lifting Movement',
            instruction:
                isTr
                    ? 'Derin bir nefes al. Nefes verirken aynı anda kollarını, göğsünü ve bacaklarını yerden kaldır. Sadece karnın yerde kalsın. 3-5 saniye tut, sonra yavaşça indir. 10 kez tekrarla.'
                    : 'Take a deep breath. As you exhale, simultaneously lift arms, chest, and legs off floor. Only belly should touch ground. Hold for 3-5 seconds, then slowly lower. Repeat 10 times.',
          ),
        ],
      ),
      Exercise(
        id: 'm1',
        name: isTr ? 'Omuz Mobilite (Duvar)' : 'Shoulder Flow (Wall)',
        description:
            isTr
                ? 'Omuzların hareket kabiliyetini artıran ve kambur duruşu (kifoz) düzeltmeye yardımcı olan harika bir mobilite hareketi.'
                : 'Improves shoulder mobility and upper back posture.',
        duration: isTr ? '3 dk' : '3 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Mobilite' : 'Mobility',
        imageUrl: 'assets/exercises/omuz-germe.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Üst Sırt', 'Omuzlar', 'Kürek Kemikleri']
                : ['Upper Back', 'Shoulders', 'Scapula'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç Pozisyonu' : 'Starting Position',
            instruction:
                isTr
                    ? 'Bir duvara sırtını yasla. Ayaklarını duvardan bir adım öne al. Kollarını "W" şeklinde bük, dirsekler ve el sırtları duvara değsin.'
                    : 'Stand with back against wall. Step feet one step away from wall. Bend arms in "W" shape, elbows and backs of hands touching wall.',
          ),
          ExerciseStep(
            title: isTr ? 'Yukarı Kaydırma' : 'Slide Up',
            instruction:
                isTr
                    ? 'Dirseklerini ve ellerini duvardan ayırmadan kollarını yavaşça yukarıya doğru kaydır ("Y" şekli). Mümkün olduğunca yukarı çık. Sonra yavaşça başlangıç pozisyonuna dön. 10-12 kez tekrarla.'
                    : 'Keeping elbows and hands in contact with wall, slowly slide arms upward ("Y" shape). Reach as high as possible. Then slowly return to starting position. Repeat 10-12 times.',
          ),
        ],
      ),
      Exercise(
        id: 'm2',
        name: isTr ? 'Göğüs ve Sırt Köprüsü' : 'T-Spine Bridge',
        description:
            isTr
                ? 'Omurga rotasyonunu geliştirmek için dinamik hareket.'
                : 'Dynamic movement to improve spinal rotation.',
        duration: isTr ? '4 dk' : '4 min',
        difficulty: isTr ? 'İleri' : 'Advanced',
        category: isTr ? 'Mobilite' : 'Mobility',
        imageUrl: 'assets/exercises/t-spine-bridge.png',
        videoUrl: '',
        muscleGroups:
            isTr ? ['Omuzlar', 'Karın', 'Sırt'] : ['Shoulders', 'Core', 'Back'],
        steps: [
          ExerciseStep(
            title:
                isTr
                    ? 'Başlangıç - Köprü Pozisyonu'
                    : 'Starting - Bridge Position',
            instruction:
                isTr
                    ? 'Sırt üstü uzan, dizlerini bük, ayaklarını yere bas. Kalçanı kaldırarak köprü pozisyonuna geç. Omuzlarından dizlerine kadar düz bir çizgi oluştur.'
                    : 'Lie on back, bend knees, plant feet on floor. Lift hips into bridge position. Create straight line from shoulders to knees.',
          ),
          ExerciseStep(
            title: isTr ? 'Sağ Kol Uzatma' : 'Right Arm Reach',
            instruction:
                isTr
                    ? 'Köprü pozisyonunda kalırken sağ kolunu başının üzerinden arkaya doğru uzat. Kalçanı daha da yukarı it. 5 saniye tut, sonra kolu indir.'
                    : 'While in bridge position, reach right arm overhead and back. Push hips even higher. Hold for 5 seconds, then lower arm.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Kol Uzatma' : 'Left Arm Reach',
            instruction:
                isTr
                    ? 'Köprü pozisyonunda kalırken sol kolunu başının üzerinden arkaya doğru uzat. Kalçanı daha da yukarı it. 5 saniye tut, sonra kolu indir. Her iki tarafı 5-8 kez tekrarla.'
                    : 'While in bridge position, reach left arm overhead and back. Push hips even higher. Hold for 5 seconds, then lower arm. Repeat both sides 5-8 times.',
          ),
        ],
      ),
      Exercise(
        id: 'm3',
        name: isTr ? 'Omurga Rotasyonu' : 'Spinal Rotation',
        description:
            isTr
                ? 'Torasik omurgadaki hareket aralığını artırır.'
                : 'Increases the range of motion in the thoracic spine.',
        duration: isTr ? '2 dk' : '2 min',
        difficulty: isTr ? 'Başlangıç' : 'Beginner',
        category: isTr ? 'Mobilite' : 'Mobility',
        imageUrl: 'assets/exercises/spinal-rotation.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Torasik Omurga', 'Oblikler']
                : ['Thoracic Spine', 'Obliques'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç Pozisyonu' : 'Starting Position',
            instruction:
                isTr
                    ? 'Sağ tarafına uzan. Dizlerini bük (90 derece). Kollarını önünde birleştir, avuç içleri birbirine baksın.'
                    : 'Lie on right side. Bend knees (90 degrees). Bring arms together in front, palms facing each other.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Kol Rotasyonu' : 'Left Arm Rotation',
            instruction:
                isTr
                    ? 'Dizlerini yerde tutarak sol kolunu bir kitap açar gibi sol tarafa doğru aç. Başını da kolla birlikte çevir. Mümkün olduğunca aç ve 3 saniye tut. Başlangıç pozisyonuna dön. 8-10 kez tekrarla.'
                    : 'Keeping knees on ground, open left arm to left side like opening a book. Turn head with arm. Open as far as possible and hold for 3 seconds. Return to start. Repeat 8-10 times.',
          ),
          ExerciseStep(
            title: isTr ? 'Taraf Değiştir' : 'Switch Sides',
            instruction:
                isTr
                    ? 'Sol tarafına uzan ve aynı hareketi sağ kolla tekrarla. Sağ kolunu sağ tarafa doğru aç, 3 saniye tut. 8-10 kez tekrarla.'
                    : 'Lie on left side and repeat same movement with right arm. Open right arm to right side, hold for 3 seconds. Repeat 8-10 times.',
          ),
        ],
      ),
      Exercise(
        id: 'm4',
        name: isTr ? 'Çökme ve Uzanma' : 'Squat & Reach',
        description:
            isTr
                ? 'Alt vücut mobilitesini torasik açılma ile birleştirir.'
                : 'Combines lower body mobility with thoracic opening.',
        duration: isTr ? '3 dk' : '3 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Mobilite' : 'Mobility',
        imageUrl: 'assets/exercises/squat-reach.png',
        videoUrl: '',
        muscleGroups:
            isTr ? ['Kalça', 'Omurga', 'Omuz'] : ['Hips', 'Spine', 'Shoulders'],
        steps: [
          ExerciseStep(
            title: isTr ? 'Başlangıç - Derin Çömelme' : 'Starting - Deep Squat',
            instruction:
                isTr
                    ? 'Ayaklarını omuz genişliğinden biraz daha açık tut. Derin bir çömelme yap. Dirseklerini dizlerinin iç tarafına yerleştir ve hafifçe dışarı it.'
                    : 'Place feet slightly wider than shoulder-width. Perform deep squat. Place elbows inside knees and gently push outward.',
          ),
          ExerciseStep(
            title: isTr ? 'Sağ Kol Rotasyonu' : 'Right Arm Rotation',
            instruction:
                isTr
                    ? 'Çömelme pozisyonunda kalırken sol elini yere koy. Sağ kolunu tavana doğru uzat ve gövdeni sağa doğru döndür. Göğsünü aç. 5 saniye tut, sonra başlangıç pozisyonuna dön.'
                    : 'While in squat position, place left hand on floor. Reach right arm toward ceiling and rotate torso to right. Open chest. Hold for 5 seconds, then return to start.',
          ),
          ExerciseStep(
            title: isTr ? 'Sol Kol Rotasyonu' : 'Left Arm Rotation',
            instruction:
                isTr
                    ? 'Çömelme pozisyonunda kalırken sağ elini yere koy. Sol kolunu tavana doğru uzat ve gövdeni sola doğru döndür. Göğsünü aç. 5 saniye tut, sonra başlangıç pozisyonuna dön. Her iki tarafı 6-8 kez tekrarla.'
                    : 'While in squat position, place right hand on floor. Reach left arm toward ceiling and rotate torso to left. Open chest. Hold for 5 seconds, then return to start. Repeat both sides 6-8 times.',
          ),
        ],
      ),
      Exercise(
        id: 'm5',
        name: isTr ? 'Tam Vücut Mobilite' : 'Total Body Flow',
        description:
            isTr
                ? 'Tüm vücudu mobilize etmek için kapsamlı bir akış.'
                : 'A comprehensive flow to mobilize the entire body.',
        duration: isTr ? '5 dk' : '5 min',
        difficulty: isTr ? 'Orta' : 'Intermediate',
        category: isTr ? 'Mobilite' : 'Mobility',
        imageUrl: 'assets/exercises/total-body-flow.png',
        videoUrl: '',
        muscleGroups:
            isTr
                ? ['Kalça', 'T-Omurga', 'Hamstringler']
                : ['Hips', 'Tspine', 'Hamstrings'],
        steps: [
          ExerciseStep(
            title:
                isTr
                    ? 'Başlangıç - Hamle Pozisyonu'
                    : 'Starting - Lunge Position',
            instruction:
                isTr
                    ? 'Sağ ayağını öne at, derin bir hamle pozisyonuna geç. Sol dizini yere koy. Ellerini sağ ayağının iki yanına yerleştir.'
                    : 'Step right foot forward into deep lunge position. Place left knee on ground. Place hands on either side of right foot.',
          ),
          ExerciseStep(
            title: isTr ? 'Dirsek-Bilek Hareketi' : 'Elbow-to-Ankle Movement',
            instruction:
                isTr
                    ? 'Sol dirseğini sağ ayak bileğine doğru indir. Kalçanı aşağı it ve esnemeyi hisset. 2 saniye tut.'
                    : 'Lower left elbow toward right ankle. Push hips down and feel the stretch. Hold for 2 seconds.',
          ),
          ExerciseStep(
            title: isTr ? 'Rotasyon ve Uzanma' : 'Rotation and Reach',
            instruction:
                isTr
                    ? 'Sol kolunu tavana doğru uzat ve gövdeni sola doğru döndür. Göğsünü aç. 2 saniye tut. Başlangıç pozisyonuna dön. 5 kez tekrarla.'
                    : 'Reach left arm toward ceiling and rotate torso to left. Open chest. Hold for 2 seconds. Return to start. Repeat 5 times.',
          ),
          ExerciseStep(
            title: isTr ? 'Taraf Değiştir' : 'Switch Sides',
            instruction:
                isTr
                    ? 'Sol ayağını öne al ve tüm hareketi diğer tarafla tekrarla. Sağ dirseği sol bilek yönüne indir, sonra sağ kolu yukarı uzat. Her iki tarafı tamamla.'
                    : 'Step left foot forward and repeat entire movement on other side. Lower right elbow toward left ankle, then reach right arm up. Complete both sides.',
          ),
        ],
      ),
    ];
  }
}
