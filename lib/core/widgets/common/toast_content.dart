import 'package:flutter/material.dart';
import 'package:minimart/core/utils/enums.dart';
import 'package:minimart/core/utils/theme/theme_extension.dart';

class AppToastContent extends StatelessWidget {
  const AppToastContent({
    required this.style,
    required this.message,
    super.key,
  });
  final ToastStyle style;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Text(
      message,
      style: theme.toastTheme.primaryBody,
    );
  }
}
