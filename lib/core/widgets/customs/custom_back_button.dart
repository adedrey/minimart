import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart/core/utils/utils.dart' show Assets, ThemeDataExtended;
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, ImageConfig, TouchableOpacity;

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.title = 'Go back',
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.appBarTheme.secondaryBorder,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: TouchableOpacity(
        onTap: context.canPop() ? context.pop : null,
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.w,
            children: [
              CustomImage(
                imageUrl: Assets.svg.arrowLeftSVG,
                config: ImageConfig(height: 7.h, width: 4.w),
              ),
              Text(
                title,
                style: theme.textStylesTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
