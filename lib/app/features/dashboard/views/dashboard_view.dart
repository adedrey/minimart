import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart/app/features/dashboard/features/cart/view_models/cart_vm.dart';
import 'package:minimart/app/features/dashboard/features/cart/views/cart_view.dart';
import 'package:minimart/app/features/dashboard/features/favorites/views/favorites_view.dart';
import 'package:minimart/app/features/dashboard/features/home/views/home_view.dart';
import 'package:minimart/app/features/dashboard/features/profile/views/profile_view.dart';
import 'package:minimart/app/features/dashboard/widgets/bottom_nav_item.dart';
import 'package:minimart/core/routes/app_routes.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/indexed_stack.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/profile')) {
      return 3;
    } else if (location.startsWith('/favorite')) {
      return 2;
    } else if (location.startsWith('/cart')) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);
    final theme = Theme.of(context).appTheme;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: LazyIndexedStack(
          index: currentIndex,
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child: const HomeView(),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: const CartView(),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: const FavoritesView(),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: const ProfileView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16.h,
          right: 16.h,
          top: 6.h,
          bottom: ScreenUtil().bottomBarHeight,
        ),
        decoration: BoxDecoration(
          color: theme.menuTheme.outline.withValues(alpha: .95),
          // border: Border(
          //   top: BorderSide(
          //     width: .4,
          //     color: theme.menuTheme.outline,
          //   ),
          // ),
        ),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            ...Menu.values.map(
              (menu) => BottomNavItem(
                item: menu,
                isActive: currentIndex == menu.index,
                totalCartItem: ref.watch(cartVMProvider).carts.length,
                onTap: () {
                  switch (menu.index) {
                    case 0:
                      const HomeRoute().go(context);
                    case 1:
                      const CartRoute().go(context);
                    case 2:
                      const FavoritesRoute().go(context);
                    case 3:
                      const ProfileRoute().go(context);
                    default:
                      const HomeRoute().go(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
