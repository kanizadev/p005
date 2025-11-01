import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF8BA888),
        scaffoldBackgroundColor: const Color(0xFF1C2321),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF9EC49B),
          secondary: const Color(0xFFB8D4B5),
          surface: const Color(0xFF2A3330),
          onPrimary: const Color(0xFF1C2321),
          onSecondary: const Color(0xFF1C2321),
          onSurface: const Color(0xFFE8F0E6),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
            .apply(
              bodyColor: const Color(0xFFD4E3D2),
              displayColor: const Color(0xFFE8F0E6),
            ),
        cardTheme: const CardThemeData(
          color: Color(0xFF2A3330),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
