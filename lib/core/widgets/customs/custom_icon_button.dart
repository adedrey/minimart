import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, ImageConfig, TouchableOpacity;

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.icon,
    required this.iconHeight,
    this.isNetwork = false,
    this.backgroundColor,
    this.height = 30,
    this.iconColor,
    this.action,
    this.borderColor,
    this.borderWidth,
    super.key,
  }) : withBackground = true;
  const CustomIconButton.noBackground({
    required this.icon,
    required this.iconHeight,
    this.isNetwork = false,
    this.action,
    this.iconColor,
    super.key,
  })  : backgroundColor = null,
        height = null,
        borderColor = null,
        borderWidth = null,
        withBackground = false;
  final String icon;
  final bool withBackground;
  final VoidCallback? action;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double iconHeight;
  final double? height;
  final double? borderWidth;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      width: (height ?? iconHeight).h,
      height: (height ?? iconHeight).h,
      alignment: Alignment.center,
      decoration: withBackground
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              border: borderColor == null
                  ? null
                  : Border.all(
                      color: borderColor!,
                      width: borderWidth ?? 1,
                    ),
            )
          : null,
      onTap: action,
      child: withBackground
          ? ClipOval(
              child: _getIconWidget(),
            )
          : _getIconWidget(),
    );
  }

  Widget _getIconWidget() {
    return CustomImage(
      imageUrl: icon,
      isNetwork: isNetwork,
      config: ImageConfig(
        fit: BoxFit.contain,
        height: iconHeight.h,
        width: iconHeight.h,
        color: iconColor,
      ),
    );
  }
}
