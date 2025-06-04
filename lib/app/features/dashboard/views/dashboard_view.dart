import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// class _DashboardViewState extends ConsumerState<DashboardView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//   int _getCurrentIndex(BuildContext context) {
//     final location = GoRouterState.of(context).uri.path;
//     if (location.startsWith('/settings')) {
//       return 4;
//     } else if (location.startsWith('/connects')) {
//       return 3;
//     } else if (location.startsWith('/messages')) {
//       return 2;
//     } else if (location.startsWith('/jobs')) {
//       return 1;
//     } else {
//       return 0;
//     }
//   }

//   Future<void> _checkVersion() async {
//     // final updateInfo =
//     //     await ref.read(appVersionCheckerServiceProvider).checkForUpdate();
//     // if (updateInfo.updateType != UpdateType.none) {
//     //   if (mounted) {
//     //     context.go(const VersionUpdateRoute().location, extra: updateInfo);
//     //   }
//     // }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentIndex = _getCurrentIndex(context);
//     final theme = Theme.of(context).appTheme;
//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: LazyIndexedStack(
//           index: currentIndex,
//           children: [
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: const HomeView(),
//             ),
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: const JobsView(),
//             ),
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: const MessagesView(),
//             ),
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: const ConnectsView(),
//             ),
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: const SettingsView(),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.only(
//           left: 16.h,
//           right: 16.h,
//           top: 16.h,
//           bottom: ScreenUtil().bottomBarHeight,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border(
//             top: BorderSide(
//               width: .4,
//               color: theme.menuTheme.outline,
//             ),
//           ),
//         ),
//         child: Wrap(
//           alignment: WrapAlignment.spaceAround,
//           children: [
//             ...Menu.values.map(
//               (menu) => BottomNavItem(
//                 item: menu,
//                 isActive: currentIndex == menu.index,
//                 onTap: () {
//                   switch (menu.index) {
//                     case 0:
//                       const HomeRoute().go(context);
//                     case 1:
//                       const JobsRoute().go(context);
//                     case 2:
//                       const MessagesRoute().go(context);
//                     case 3:
//                       const ConnectsRoute().go(context);
//                     case 4:
//                       const SettingsRoute().go(context);
//                     default:
//                       const HomeRoute().go(context);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
