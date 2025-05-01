import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData().copyWith(
        textTheme: TextTheme().copyWith(
          bodyMedium: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          bodyLarge: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          bodySmall: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          displayLarge: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          displayMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          displaySmall: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          headlineMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          headlineSmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          titleLarge: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          titleMedium: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          titleSmall: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        ),
      ),
    ),
  );
}
