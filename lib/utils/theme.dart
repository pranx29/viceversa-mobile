import 'package:flutter/material.dart';

class AppTheme {
  static final ButtonStyle buttonStyle = ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    textStyle: WidgetStateProperty.all<TextStyle>(
      textTheme.labelLarge ?? TextStyle(),
    ),
    minimumSize: WidgetStateProperty.all<Size>(
      Size(100, 48),
    ),
    maximumSize: WidgetStateProperty.all<Size>(
      Size(200, 64),
    ),
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 57.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.25,
      height: 1.2,  // Line height for displayLarge
    ),
    displayMedium: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      height: 1.3,  // Line height for displayMedium
    ),
    displaySmall: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      height: 1.4,  // Line height for displaySmall
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      height: 1.5,  // Line height for headlineLarge
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      height: 1.6,  // Line height for headlineMedium
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      height: 1.6,  // Line height for headlineSmall
    ),
    titleLarge: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      height: 1.5,  // Line height for titleLarge
    ),
    titleMedium: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      height: 1.4,  // Line height for titleMedium
    ),
    titleSmall: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      height: 1.4,  // Line height for titleSmall
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      height: 1.5,  // Line height for bodyLarge
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      height: 1.5,  // Line height for bodyMedium
    ),
    bodySmall: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      height: 1.5,  // Line height for bodySmall
    ),
    labelLarge: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      height: 1.4,  // Line height for labelLarge
    ),
    labelMedium: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      height: 1.4,  // Line height for labelMedium
    ),
    labelSmall: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      height: 1.4,  // Line height for labelSmall
    ),
  );

  static final ColorScheme darkColorTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Color(0xFF1A1B1E),
    onSecondary: Color(0xFFD4D4D4),
    surface: Color(0xFF101010),
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  );

  static final ColorScheme lightColorTheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF101112),
    onPrimary: Colors.white,
    secondary: Color(0xFFE4E4E4),
    onSecondary: Color(0xFF1A1B1E),
    surface: Colors.white,
    onSurface: Color(0xFF101112),
    error: Colors.red,
    onError: Colors.white,
  );

  static buildElevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: buttonStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(colorScheme.primary),
        foregroundColor: WidgetStateProperty.all<Color>(colorScheme.onPrimary),
        overlayColor: WidgetStateProperty.all<Color>(
            colorScheme.onPrimary.withOpacity(0.1)),
      ),
    );
  }

  static buildOutlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: buttonStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        foregroundColor: WidgetStateProperty.all<Color>(colorScheme.primary),
        overlayColor: WidgetStateProperty.all<Color>(
            colorScheme.primary.withOpacity(0.1)),
        side: WidgetStateProperty.all<BorderSide>(
            BorderSide(color: colorScheme.primary)),
      ),
    );
  }

  static ThemeData buildTheme(ColorScheme colorScheme, Brightness brightness) {
    return ThemeData(
      fontFamily: 'Nunito',
      brightness: brightness,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface
      ),
      //textTheme: textTheme,
      elevatedButtonTheme: buildElevatedButtonTheme(colorScheme),
      outlinedButtonTheme: buildOutlinedButtonTheme(colorScheme),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSecondary,
        showUnselectedLabels: false,
        elevation: 8,
      ),
        cardTheme: CardTheme(
            color: colorScheme.surface,
        ),

    );
  }

  static final ThemeData lightTheme =
  buildTheme(lightColorTheme, Brightness.light);
  static final ThemeData darkTheme =
  buildTheme(darkColorTheme, Brightness.dark);

}
