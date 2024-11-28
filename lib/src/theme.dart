import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryLight = Color(0xFF5ddff1); // Azul-claro
  static const Color onPrimaryLight =
      Colors.white; // Texto ou ícones em botões primários
  static const Color secondaryLight = Color(0xFFFFF9C4); // Amarelo-claro
  static const Color onSecondaryLight =
      Colors.black; // Texto ou ícones em botões secundários
  static const Color backgroundLight = Color(0xFFFFFFFF); // Fundo branco
  static const Color surfaceLight =
      Color(0xFFF5F5F5); // Cinza-claro para superfícies
  static const Color onSurfaceLight = Colors.black87; // Texto em superfícies

  static const Color appBarBackgroundLight = Color(0xFFB2EBF2); // Azul-claro
  static const Color appBarIconLight = Colors.black; // Ícones no AppBar
  static const Color appBarTitleLight = Colors.black; // Título no AppBar
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight, // Azul-claro
      onPrimary:
          AppColors.onPrimaryLight, // Texto ou ícones em botões primários
      secondary: AppColors.secondaryLight, // Amarelo-claro
      onSecondary:
          AppColors.onSecondaryLight, // Texto ou ícones em botões secundários
      background: AppColors.backgroundLight, // Fundo branco
      surface: AppColors.surfaceLight, // Cinza-claro para superfícies
      onSurface: AppColors.onSurfaceLight, // Texto em superfícies
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight, // Fundo branco
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight, // Azul-claro
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.appBarIconLight),
      titleTextStyle: TextStyle(
        color: AppColors.appBarTitleLight,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      // Headline Styles
      headlineLarge: GoogleFonts.baloo2(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),
      headlineMedium: GoogleFonts.baloo2(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),
      headlineSmall: GoogleFonts.baloo2(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),

      // Usando a fonte Baloo para os títulos
      displayLarge: GoogleFonts.baloo2(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),
      displayMedium: GoogleFonts.baloo2(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),
      displaySmall: GoogleFonts.baloo2(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurfaceLight,
      ),

      // Usando a fonte Poppins para o corpo do texto
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: AppColors.onSurfaceLight,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: AppColors.onSurfaceLight.withOpacity(0.54),
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        color: AppColors.onSurfaceLight.withOpacity(0.45),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight, // Azul-claro
        foregroundColor: AppColors.onPrimaryLight, // Cor do texto
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceLight, // Cinza-claro
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 2,
    ),
    iconTheme: IconThemeData(
      color: AppColors.onSurfaceLight.withOpacity(0.54), // Cinza médio
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight, // Cinza-claro
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColors.onSurfaceLight.withOpacity(0.45)),
    ),
  );
}
