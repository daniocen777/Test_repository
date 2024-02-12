import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        colorSchemeSeed: const Color(0xff2862f5),
        // colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
      );
}
