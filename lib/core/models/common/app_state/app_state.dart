import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  factory AppState({
    required ThemeMode themeMode,
  }) = _AppState;

  factory AppState.initial() => AppState(
        themeMode: ThemeMode.system,
      );
}
