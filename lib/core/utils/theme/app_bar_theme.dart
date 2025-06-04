import 'package:flutter/material.dart';

class ApppBarTheme extends ThemeExtension<ApppBarTheme> {
  const ApppBarTheme({
    required this.title,
    required this.subtitle,
    required this.border,
    required this.secondaryBorder,
  });
  final TextStyle title;
  final TextStyle subtitle;
  final Color border;
  final Color secondaryBorder;

  @override
  ApppBarTheme lerp(
    ApppBarTheme? other,
    double t,
  ) {
    if (other is! ApppBarTheme) {
      return this;
    }
    return ApppBarTheme(
      title: title,
      subtitle: subtitle,
      border: border,
      secondaryBorder: secondaryBorder,
    );
  }

  @override
  ThemeExtension<ApppBarTheme> copyWith({
    Color? border,
    Color? secondaryBorder,
    TextStyle? title,
    TextStyle? subtitle,
  }) {
    return ApppBarTheme(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        border: border ?? this.border,
        secondaryBorder: secondaryBorder ?? this.secondaryBorder);
  }
}
