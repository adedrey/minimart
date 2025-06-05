// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  const AppButtonTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryBorderColor,
    required this.primaryTextStyle,
    required this.tertiaryColor,
    required this.surfaceColor,
  });
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryBorderColor;
  final Color surfaceColor;
  final Color tertiaryColor;
  final TextStyle primaryTextStyle;

  @override
  AppButtonTheme lerp(
    AppButtonTheme? other,
    double t,
  ) {
    if (other is! AppButtonTheme) {
      return this;
    }
    return AppButtonTheme(
      primaryColor: primaryColor,
      primaryTextStyle: primaryTextStyle,
      tertiaryBorderColor: tertiaryBorderColor,
      tertiaryColor: tertiaryColor,
      secondaryColor: secondaryColor,
      surfaceColor: surfaceColor,
    );
  }

  @override
  ThemeExtension<AppButtonTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryBorderColor,
    Color? tertiaryColor,
    TextStyle? primaryTextStyle,
    Color? secondaryColor,
    Color? surfaceColor,
  }) {
    return AppButtonTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryTextStyle: primaryTextStyle ?? this.primaryTextStyle,
      tertiaryBorderColor: tertiaryBorderColor ?? this.tertiaryBorderColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
    );
  }
}
