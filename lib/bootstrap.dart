import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart/app/view/app.dart';
import 'package:minimart/core/app_provider_observer.dart';
import 'package:minimart/core/config/env/app_environment.dart';

Future<void> bootstrap(AppEnvironment environment) async {
  try {
    runApp(
      ProviderScope(
        observers: [
          if (!kReleaseMode)
            AppProviderObserver(enableDetailedLogs: !kReleaseMode),
        ],
        child: const App(),
      ),
    );
  } catch (error, stack) {
    debugPrint('Error during initialization: $error\n$stack');
    rethrow;
  }
}
