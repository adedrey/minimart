// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppMenuTheme extends ThemeExtension<AppMenuTheme> {
  const AppMenuTheme({
    required this.primaryColor,
    required this.primaryIdleColor,
    required this.outline,
    required this.primaryTextStyle,
    required this.primaryIdleTextStyle,
    required this.iconSize,
  });

  final Color primaryColor;
  final Color primaryIdleColor;
  final Color outline;
  final TextStyle primaryTextStyle;
  final TextStyle primaryIdleTextStyle;
  final double iconSize;

  @override
  AppMenuTheme lerp(
    AppMenuTheme? other,
    double t,
  ) {
    if (other is! AppMenuTheme) {
      return this;
    }
    return AppMenuTheme(
      primaryColor: primaryColor,
      primaryIdleColor: primaryIdleColor,
      primaryIdleTextStyle: primaryIdleTextStyle,
      primaryTextStyle: primaryTextStyle,
      iconSize: iconSize,
      outline: outline,
    );
  }

  @override
  ThemeExtension<AppMenuTheme> copyWith({
    Color? primaryColor,
    Color? primaryIdleColor,
    TextStyle? primaryIdleTextStyle,
    TextStyle? primaryTextStyle,
    double? iconSize,
    Color? outline,
  }) {
    return AppMenuTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryTextStyle: primaryTextStyle ?? this.primaryTextStyle,
      primaryIdleColor: primaryIdleColor ?? this.primaryIdleColor,
      primaryIdleTextStyle: primaryIdleTextStyle ?? this.primaryIdleTextStyle,
      iconSize: iconSize ?? this.iconSize,
      outline: outline ?? this.outline,
    );
  }
}
