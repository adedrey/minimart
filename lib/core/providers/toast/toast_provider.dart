import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/utils.dart' show ToastStyle;
import 'package:minimart/core/widgets/widgets.dart' show AppToastContent;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';

part 'toast_provider.g.dart';

@riverpod
ToastificationItem toast(
  Ref ref, {
  required ToastStyle style,
  required String message,
}) {
  final toastInstance = Toastification();
  return toastInstance.show(
    style: ToastificationStyle.minimal,
    primaryColor: style.bgColor,
    showIcon: true,
    borderRadius: BorderRadius.circular(8.r),
    boxShadow: [
      const BoxShadow(
        color: Color(0x26000000),
        offset: Offset(0, 16),
        blurRadius: 24,
      ),
    ],
    description: AppToastContent(style: style, message: message),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
