import 'package:flutter/material.dart' show Color;
import 'package:minimart/core/utils/theme/theme.dart' show AppColors;

enum ImageType { svg, png, jpg, jpeg, gif, webp, unknown }

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
  cart(label: 'Cart', icon: 'assets/svg/cart.svg'),
  favorites(label: 'Favorites', icon: 'assets/svg/like.svg'),
  profile(label: 'Profile', icon: 'assets/svg/profile.svg');

  const Menu({
    required this.label,
    required this.icon,
  });
  final String label;
  final String icon;
}
