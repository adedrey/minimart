import 'package:flutter/material.dart' show Color;
import 'package:minimart/core/utils/theme/theme.dart' show AppColors;

enum ImageType { svg, png, jpg, jpeg, gif, webp, unknown }

enum LoadingState { initial, loading, fetchingMore }

enum DataState { empty, loaded, fetchedAll }

enum ToastStyle {
  success(
    bgColor: AppColors.kColorSuccess500,
    textColor: AppColors.kColorWhite,
  ),

  error(
    bgColor: AppColors.kColorSuccess500,
    textColor: AppColors.kColorWhite,
  ),
  warning(
    bgColor: AppColors.kColorSuccess500,
    textColor: AppColors.kColorWhite,
  ),
  neutral(
    bgColor: AppColors.kColorSuccess500,
    textColor: AppColors.kColorWhite,
  );

  const ToastStyle({required this.bgColor, required this.textColor});
  final Color bgColor;
  final Color textColor;
}

enum Menu {
  home(label: 'Home', icon: 'assets/svg/home.svg'),
  jobs(label: 'Jobs', icon: 'assets/svg/bulb.svg'),
  messages(label: 'Messages', icon: 'assets/svg/notification-status.svg'),
  connects(label: 'Connects', icon: 'assets/svg/connect.svg'),
  settings(label: 'Settings', icon: 'assets/svg/setting.svg');

  const Menu({
    required this.label,
    required this.icon,
  });
  final String label;
  final String icon;
}
