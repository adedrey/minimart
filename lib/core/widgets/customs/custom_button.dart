import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/theme/theme_extension.dart';
import 'package:minimart/core/widgets/widgets.dart' show TouchableOpacity;

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.action,
    required this.label,
    this.width,
    this.height,
    this.isDisabled,
    this.isLoading = false,
    super.key,
  });

  final double? width;
  final double? height;
  final VoidCallback action;
  final bool? isDisabled;
  final bool isLoading;
  final String label;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).appTheme;
    final backgroundColor = appTheme.buttonTheme.primaryColor;
    final labelWidget = Center(
      child: isLoading
          ? CupertinoActivityIndicator(
              color: appTheme.buttonTheme.primaryTextStyle.color,
            )
          : Text(
              label,
              style: appTheme.buttonTheme.primaryTextStyle,
            ),
    );
    return TouchableOpacity(
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height ?? 40.h,
      onTap: !isLoading ? action : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: labelWidget,
    );
  }
}
