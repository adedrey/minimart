// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ToastTheme extends ThemeExtension<ToastTheme> {
  const ToastTheme({
    required this.successColor,
    required this.primaryBody,
  });
  final Color successColor;
  final TextStyle primaryBody;

  @override
  ToastTheme lerp(
    ToastTheme? other,
    double t,
  ) {
    if (other is! ToastTheme) {
      return this;
    }
    return ToastTheme(
      successColor: successColor,
      primaryBody: primaryBody,
    );
  }

  @override
  ThemeExtension<ToastTheme> copyWith({
    Color? successColor,
    TextStyle? primaryBody,
  }) {
    return ToastTheme(
      successColor: successColor ?? this.successColor,
      primaryBody: primaryBody ?? this.primaryBody,
    );
  }
}
