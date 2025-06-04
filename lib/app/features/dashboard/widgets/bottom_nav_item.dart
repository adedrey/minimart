import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/theme/theme_extension.dart';
import 'package:minimart/core/utils/utils.dart' show Menu;
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, ImageConfig, TouchableOpacity;

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.isActive,
    required this.onTap,
    required this.item,
    super.key,
  });

  final Menu item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return TouchableOpacity(
      onTap: onTap,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          spacing: 4.h,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: isActive
                    ? theme.menuTheme.primaryColor
                    : theme.menuTheme.primaryIdleColor,
              ),
              child: CustomImage(
                imageUrl: item.icon,
                config: ImageConfig(
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.contain,
                  color: isActive ? theme.menuTheme.outline : null,
                ),
              ),
            ),
            Text(
              item.label,
              style: isActive
                  ? theme.menuTheme.primaryTextStyle
                  : theme.menuTheme.primaryIdleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
