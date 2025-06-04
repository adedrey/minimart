import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nex360/core/utils/theme/theme_extension.dart';
import 'package:nex360/core/utils/utils.dart' show Menu;
import 'package:nex360/core/widgets/widgets.dart'
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
      padding: EdgeInsets.symmetric(horizontal: 14.5.h),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          spacing: 6.h,
          children: [
            CustomImage(
              imageUrl: item.icon,
              config: ImageConfig(
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
                color: isActive
                    ? theme.menuTheme.primaryColor
                    : theme.menuTheme.primaryIdleColor,
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
