import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    style: ToastificationStyle.fillColored,
    primaryColor: style.bgColor,
    showIcon: false,
    description: AppToastContent(style: style, message: message),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
