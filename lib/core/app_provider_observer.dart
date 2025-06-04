import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppProviderObserver extends ProviderObserver {
  AppProviderObserver({this.enableDetailedLogs = false});

  final bool enableDetailedLogs;

  void _logEvent(
    String type, {
    required ProviderBase<dynamic> provider,
    Object? value,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!enableDetailedLogs) return;

    final logData = {
      'timestamp': DateTime.now().toIso8601String(),
      'type': type,
      'provider': provider.name ?? provider.runtimeType.toString(),
      if (value != null) 'value': value.toString(),
      if (error != null) 'error': error.toString(),
      if (stackTrace != null) 'stackTrace': stackTrace.toString(),
    };

    log(json.encode(logData));
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logEvent(
      'provider_added',
      provider: provider,
      value: value,
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _logEvent(
      'provider_failed',
      provider: provider,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logEvent(
      'provider_updated',
      provider: provider,
      value: newValue,
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    _logEvent(
      'provider_disposed',
      provider: provider,
    );
    super.didDisposeProvider(provider, container);
  }
}
