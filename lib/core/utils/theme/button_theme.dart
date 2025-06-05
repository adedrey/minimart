// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  const AppButtonTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryBorderColor,
    required this.surfaceColor,
    required this.tertiaryColor,
    required this.primaryTextStyle,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.tertiaryIconColor,
  });
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryBorderColor;
  final Color surfaceColor;
  final Color tertiaryColor;
  final TextStyle primaryTextStyle;
  final Color primaryIconColor;
  final Color secondaryIconColor;
  final Color tertiaryIconColor;

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
      primaryIconColor: primaryIconColor,
      secondaryIconColor: secondaryIconColor,
      tertiaryIconColor: tertiaryIconColor,
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
    Color? primaryIconColor,
    Color? secondaryIconColor,
    Color? tertiaryIconColor,
  }) {
    return AppButtonTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryTextStyle: primaryTextStyle ?? this.primaryTextStyle,
      tertiaryBorderColor: tertiaryBorderColor ?? this.tertiaryBorderColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      primaryIconColor: primaryIconColor ?? this.primaryIconColor,
      secondaryIconColor: secondaryIconColor ?? this.secondaryIconColor,
      tertiaryIconColor: tertiaryIconColor ?? this.tertiaryIconColor,
    );
  }
}
