import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor:
        const Color(0xFF2E0249), // Deep Purple from screenshots
    primaryColor: const Color(0xFFA91079),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFA91079),
      secondary: Color(0xFF570A57),
      surface: Color(0xFF2E0249),
      background: Color(0xFF0F044C), // Deep blue/purple
    ),
    textTheme: GoogleFonts.cinzelTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.cinzel(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.raleway(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA91079),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
  );
}
