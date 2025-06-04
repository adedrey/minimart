// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackgroundTheme extends ThemeExtension<BackgroundTheme> {
  const BackgroundTheme({
    required this.onPrimary,
    required this.scaffoldColor,
  });
  final Color scaffoldColor;
  final Color onPrimary;
  @override
  BackgroundTheme lerp(
    BackgroundTheme? other,
    double t,
  ) {
    if (other is! BackgroundTheme) {
      return this;
    }
    return BackgroundTheme(
      scaffoldColor: scaffoldColor,
      onPrimary: onPrimary,
    );
  }

  @override
  ThemeExtension<BackgroundTheme> copyWith({
    Color? scaffoldColor,
    Color? onPrimary,
  }) {
    return BackgroundTheme(
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      onPrimary: onPrimary ?? this.onPrimary,
    );
  }
}
