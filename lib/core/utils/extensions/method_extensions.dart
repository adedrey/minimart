import 'dart:async';

import 'package:flutter/material.dart';

extension FutureExtension<T> on Future<T> {
  Future<T> afterFrame() {
    final completer = Completer<T>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      then(
        completer.complete,
        onError: completer.completeError,
      );
    });

    return completer.future;
  }
}

extension VoidCallbackExtension on void Function() {
  void afterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      this();
    });
  }
}
