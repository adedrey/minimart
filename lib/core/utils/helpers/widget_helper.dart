import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WidgetHelper {
  static double bottomGapOS() => Platform.isIOS
      ? ScreenUtil().bottomBarHeight
      : ScreenUtil().bottomBarHeight + 10.h;

  static Widget bottomGap() => Gap(bottomGapOS());

  static EdgeInsets safeArea() => EdgeInsets.only(
      top: Platform.isIOS
          ? ScreenUtil().statusBarHeight
          : ScreenUtil().statusBarHeight + 10.h);
}
