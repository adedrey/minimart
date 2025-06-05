import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/utils.dart'
    show AppString, Assets, ThemeDataExtended;
import 'package:minimart/core/widgets/customs/custom_input.dart';
import 'package:minimart/core/widgets/widgets.dart'
    show CustomIconButton, CustomImage, ImageConfig;

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {required this.location,
      this.controller,
      this.showInput = false,
      super.key});
  final String location;
  final bool showInput;
  final TextEditingController? controller;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 0, 16.h, 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.appBarTheme.border,
          ),
        ),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                imageUrl: Assets.images.logoPNG,
                config: ImageConfig(
                  width: 56.h,
                  height: 28.h,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppString.deliveryAddress,
                      style: theme.appBarTheme.title,
                    ),
                    Text(
                      widget.location,
                      style: theme.appBarTheme.subtitle,
                    ),
                  ],
                ),
              ),
              CustomIconButton.noBackground(
                icon: Assets.svg.notificationSVG,
                iconHeight: 24,
              ),
            ],
          ),
          if (widget.showInput)
            CustomInput(
              controller: widget.controller!,
              prefix: Assets.svg.searchSVG,
              placeholder: 'Search...',
            ),
        ],
      ),
    );
  }
}
