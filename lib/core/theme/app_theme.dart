import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryTeal,
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardColor: AppColors.lightCard,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryTeal,
        secondary: AppColors.mintGreen,
        tertiary: AppColors.softIndigo,
        surface: AppColors.lightSurface,
        error: AppColors.error,
        onSurface: AppColors.black,
      ),
      cardTheme: CardTheme(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightPlaceholder,
        labelStyle: const TextStyle(color: AppColors.lightBodyText),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.lightSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryTeal,
        unselectedItemColor: AppColors.lightSubtext,
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryTeal,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryTeal,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.darkCard,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryTeal,
        secondary: AppColors.mintGreen,
        tertiary: AppColors.softIndigo,
        surface: AppColors.darkSurface,
        error: AppColors.error,
        onSurface: Colors.white,
      ),
      cardTheme: CardTheme(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkBorder,
        labelStyle: const TextStyle(color: AppColors.darkBodyText),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.darkSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.primaryTeal,
        unselectedItemColor: AppColors.darkSubtext,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryTeal,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
