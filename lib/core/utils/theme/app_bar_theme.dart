import 'package:flutter/material.dart';

class ApppBarTheme extends ThemeExtension<ApppBarTheme> {
  const ApppBarTheme({
    required this.title,
    required this.subtitle,
  });
  final TextStyle title;
  final TextStyle subtitle;

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
    );
  }

  @override
  ThemeExtension<ApppBarTheme> copyWith({
    Color? outline,
    TextStyle? title,
    TextStyle? subtitle,
  }) {
    return ApppBarTheme(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
