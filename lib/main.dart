import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'services/auth_service.dart';
import 'services/exercise_service.dart';
import 'services/theme_service.dart';
import 'services/api_service.dart';
import 'services/language_service.dart';
import 'screens/splash_screen.dart';
import 'screens/health_disclaimer_screen.dart';

void main() async {
  // 1. Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize SharedPreferences ONCE
  final prefs = await SharedPreferences.getInstance();

  // 3. Initialize Services with the shared prefs
  final themeService = ThemeService();
  await themeService.init(prefs);

  final apiService = ApiService();
  await apiService.init(prefs);

  final languageService = LanguageService();
  await languageService.init(prefs);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeService),
        ChangeNotifierProvider.value(value: languageService),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProxyProvider<LanguageService, ExerciseService>(
          create: (context) => ExerciseService(),
          update: (context, lang, exercise) {
            final svc = exercise ?? ExerciseService();
            svc.updateLocale(lang.locale.languageCode);
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
    final themeService = context.watch<ThemeService>();
    final languageService = context.watch<LanguageService>();

    return MaterialApp(
      title: 'ScolioFit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeService.themeMode,
      locale: languageService.locale,
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
