// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputTheme extends ThemeExtension<InputTheme> {
  const InputTheme({
    required this.hintStyle,
    required this.border,
  });
  final TextStyle hintStyle;
  final InputBorder border;

  @override
  InputTheme lerp(
    InputTheme? other,
    double t,
  ) {
    if (other is! InputTheme) {
      return this;
    }
    return InputTheme(
      hintStyle: hintStyle,
      border: border,
    );
  }

  @override
  ThemeExtension<InputTheme> copyWith({
    TextStyle? hintStyle,
    InputBorder? border,
  }) {
    return InputTheme(
      hintStyle: hintStyle ?? this.hintStyle,
      border: border ?? this.border,
    );
  }
}
