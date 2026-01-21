import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/exercise_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'services/firebase_auth_service.dart';

import 'screens/splash_screen.dart';
import 'screens/health_disclaimer_screen.dart';
import 'firebase_options.dart';

void main() async {
  // 1. Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

  // 3. Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // 4. Initialize Providers
  final themeProvider = ThemeProvider();
  await themeProvider.init(prefs);

  final languageProvider = LanguageProvider();
  await languageProvider.init(prefs);

  // Initialize FirebaseAuthService
  final firebaseAuthService = FirebaseAuthService(); // Added initialization

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: languageProvider),
        ChangeNotifierProvider(create: (_) => firebaseAuthService), // Added
        ChangeNotifierProvider(
          create:
              (context) =>
                  AuthProvider(context.read<FirebaseAuthService>()), // Modified
        ),
        ChangeNotifierProxyProvider<AuthProvider, ExerciseProvider>(
          create: (context) => ExerciseProvider(),
          update: (context, auth, exercise) {
            final svc = exercise ?? ExerciseProvider();
            svc.updateUserId(auth.user?.uid);
            return svc;
          },
        ),
      ],
      child: const ScolioFitApp(),
    ),
  );
}

class ScolioFitApp extends StatelessWidget {
  const ScolioFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();

    return MaterialApp(
      title: 'ScolioFit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: languageProvider.locale,
      supportedLocales: const [Locale('en'), Locale('tr')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/disclaimer': (context) => const HealthDisclaimerScreen(initial: true),
      },
    );
  }
}
