import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart/core/routes/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const HomeRoute().location,
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose);
  return router;
}
