import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/providers/app/app_settings_provider.dart';
import 'package:minimart/core/routes/app_router.dart';
import 'package:minimart/core/utils/theme/app_theme.dart'
    show darkTheme, lightTheme;
import 'package:toastification/toastification.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(appSettingsProvider).themeMode;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ToastificationWrapper(
            child: MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              title: 'Minimart',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
            ),
          ),
        );
      },
    );
  }
}
