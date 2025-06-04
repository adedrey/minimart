import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart/core/providers/toast/toast_provider.dart';
import 'package:minimart/core/utils/utils.dart' show ToastStyle;

extension ToastX on BuildContext {
  void showToast({
    required String message,
    ToastStyle style = ToastStyle.neutral,
    Duration? duration,
  }) {
    ProviderScope.containerOf(this).read(
      toastProvider(
        style: style,
        message: message,
      ),
    );
  }

  void showSuccessToast(String message, {Duration? duration}) {
    showToast(
      message: message,
      style: ToastStyle.success,
      duration: duration,
    );
  }

  void showErrorToast(String message, {Duration? duration}) {
    showToast(
      message: message,
      style: ToastStyle.error,
      duration: duration,
    );
  }

  void showInfoToast(String message, {Duration? duration}) {
    showToast(
      message: message,
      duration: duration,
    );
  }

  void showWarningToast(String message, {Duration? duration}) {
    showToast(
      message: message,
      style: ToastStyle.warning,
      duration: duration,
    );
  }
}

extension StringToastX on String {
  void showAsToast(
    BuildContext context, {
    ToastStyle style = ToastStyle.neutral,
    Duration? duration,
  }) {
    context.showToast(
      message: this,
      style: style,
      duration: duration,
    );
  }

  void showAsSuccessToast(BuildContext context, {Duration? duration}) {
    showAsToast(
      context,
      style: ToastStyle.success,
      duration: duration,
    );
  }

  void showAsErrorToast(BuildContext context, {Duration? duration}) {
    showAsToast(
      context,
      style: ToastStyle.error,
      duration: duration,
    );
  }
}
