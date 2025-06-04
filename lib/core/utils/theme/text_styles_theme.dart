// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextStylesTheme extends ThemeExtension<TextStylesTheme> {
  const TextStylesTheme({
    required this.displaySmall,
    required this.titleLarge,
    required this.titleSmall,
    required this.bodySmall,
    required this.labelSmall,
    required this.primaryTitleSmall,
    required this.primaryDisplaySmall,
    required this.bodyLarge,
    required this.labelLarge,
    required this.displayLarge,
    required this.inverseBodySmall,
    required this.inverseXtraBodySmall,
  });
  final TextStyle displaySmall;
  final TextStyle titleLarge;
  final TextStyle titleSmall;
  final TextStyle bodySmall;
  final TextStyle labelSmall;
  final TextStyle primaryTitleSmall;
  final TextStyle primaryDisplaySmall;
  final TextStyle bodyLarge;
  final TextStyle labelLarge;
  final TextStyle displayLarge;
  final TextStyle inverseBodySmall;
  final TextStyle inverseXtraBodySmall;

  @override
  TextStylesTheme lerp(
    TextStylesTheme? other,
    double t,
  ) {
    if (other is! TextStylesTheme) {
      return this;
    }
    return TextStylesTheme(
      displaySmall: displaySmall,
      titleLarge: titleLarge,
      titleSmall: titleSmall,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
      primaryTitleSmall: primaryTitleSmall,
      primaryDisplaySmall: primaryDisplaySmall,
      bodyLarge: bodyLarge,
      labelLarge: labelLarge,
      displayLarge: displayLarge,
      inverseBodySmall: inverseBodySmall,
      inverseXtraBodySmall: inverseXtraBodySmall,
    );
  }

  @override
  ThemeExtension<TextStylesTheme> copyWith({
    TextStyle? displaySmall,
    TextStyle? titleLarge,
    TextStyle? titleSmall,
    TextStyle? bodySmall,
    TextStyle? labelSmall,
    TextStyle? primaryBodySmall,
    TextStyle? primaryTitleSmall,
    TextStyle? primaryDisplaySmall,
    TextStyle? bodyLarge,
    TextStyle? labelLarge,
    TextStyle? labelXtraSmall,
    TextStyle? displayLarge,
    TextStyle? inverseBodySmall,
    TextStyle? inverseXtraBodySmall,
  }) {
    return TextStylesTheme(
      displaySmall: displaySmall ?? this.displaySmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleSmall: titleSmall ?? this.titleSmall,
      bodySmall: bodySmall ?? this.bodySmall,
      labelSmall: labelSmall ?? this.labelSmall,
      primaryTitleSmall: primaryTitleSmall ?? this.primaryTitleSmall,
      primaryDisplaySmall: primaryDisplaySmall ?? this.primaryDisplaySmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      labelLarge: labelLarge ?? this.labelLarge,
      displayLarge: displayLarge ?? this.displayLarge,
      inverseBodySmall: inverseBodySmall ?? this.inverseBodySmall,
      inverseXtraBodySmall: inverseXtraBodySmall ?? this.inverseXtraBodySmall,
    );
  }
}
