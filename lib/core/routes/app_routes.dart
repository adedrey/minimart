import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart/app/features/dashboard/features/cart/views/cart_view.dart';
import 'package:minimart/app/features/dashboard/features/favorites/views/favorites_view.dart';
import 'package:minimart/app/features/dashboard/features/home/views/home_view.dart';
import 'package:minimart/app/features/dashboard/features/profile/views/profile_view.dart';
import 'package:minimart/app/features/dashboard/views/dashboard_view.dart';

part 'app_routes.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/',
      name: 'home',
      routes: <TypedRoute<RouteData>>[],
    ),
    TypedGoRoute<CartRoute>(
      path: '/cart',
      name: 'cart',
      routes: <TypedRoute<RouteData>>[],
    ),
    TypedGoRoute<FavoritesRoute>(
      path: '/favorite',
      name: 'favorite',
      // routes: <TypedRoute<RouteData>>[],
    ),
    TypedGoRoute<ProfileRoute>(
      path: '/profile',
      name: 'profile',
      // routes: <TypedRoute<RouteData>>[],
    ),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  const DashboardShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return const DashboardView();
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CartView();
}

class FavoritesRoute extends GoRouteData {
  const FavoritesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavoritesView();
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileView();
}
