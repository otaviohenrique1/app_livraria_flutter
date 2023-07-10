import 'package:app_livraria_flutter/themes/themes_colors.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ThemesColors.blue),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemesColors.blue,
    titleTextStyle: TextStyle(
      color: ThemesColors.white,
      fontSize: 22,
    ),
  ),
);
