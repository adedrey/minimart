import 'package:flutter/material.dart';
import 'package:minimart/core/utils/theme/app_theme.dart';

extension ThemeDataExtended on ThemeData {
  AppTheme get appTheme => extension<AppTheme>()!;
}

extension ThemeBrightnessExtension on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;
}

extension ThemeModeExtension on ThemeMode {
  String get name => toString().split('.').last;

  static ThemeMode fromString(String name) {
    return ThemeMode.values.firstWhere((e) => e.name == name);
  }
}
