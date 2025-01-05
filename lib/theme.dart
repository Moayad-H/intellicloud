import 'package:flutter/material.dart';
import 'package:intellicloud/assets/colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // Material 3 Support
    useMaterial3: true,

    // Color Scheme
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkTealBlue,
      onPrimary: AppColors.brightWhite,
      secondary: AppColors.mintGreen,
      onSecondary: AppColors.brightWhite,
      error: AppColors.errorRed,
      onError: AppColors.brightWhite,
      // background: AppColors.charcoalGray,

      surface: AppColors.charcoalGray,
      onSurface: AppColors.brightWhite,
    ),

    // Background and Surface Colors
    scaffoldBackgroundColor: AppColors.charcoalGray,
    canvasColor: AppColors.charcoalGray,
    cardColor: AppColors.deepBlue,
    dialogBackgroundColor: AppColors.charcoalGray,

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkTealBlue,
      foregroundColor: AppColors.brightWhite,
      elevation: 4,
      iconTheme: IconThemeData(color: AppColors.brightWhite),
      titleTextStyle: TextStyle(
        color: AppColors.brightWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mintGreen,
        foregroundColor: AppColors.brightWhite,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.mintGreen),
        foregroundColor: AppColors.mintGreen,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.softCyan,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.lightGray,
      thickness: 1,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.steelBlue,
      hintStyle: TextStyle(color: AppColors.textLightGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.softCyan),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.softCyan),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.mintGreen),
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.brightWhite,
      size: 24,
    ),

    // Typography and Text Theme
    fontFamily: 'Roboto', // You can customize the font
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.brightWhite,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        height: 1.5,
      ),
      headlineSmall: TextStyle(
        color: AppColors.brightWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textLightGray,
        fontSize: 16,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textLightGray,
        fontSize: 14,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        height: 1.5,
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.deepBlue,
      shadowColor: AppColors.steelBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mintGreen,
      foregroundColor: AppColors.brightWhite,
    ),

    // Tooltip Theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.darkTealBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: TextStyle(color: AppColors.brightWhite),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.mintGreen,
      linearTrackColor: AppColors.softCyan,
    ),
  );
}
