import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, ImageConfig;

class CustomInput extends StatefulWidget {
  const CustomInput({
    required this.controller,
    this.keyboard = TextInputType.text,
    this.action = TextInputAction.next,
    this.label,
    this.isLoading = false,
    this.autoCorrect = false,
    this.autoFocus = false,
    this.onChange,
    this.filled,
    this.prefix,
    this.placeholder,
    super.key,
  });

  final String? label;
  final String? placeholder;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool isLoading;
  final bool autoCorrect;
  final bool autoFocus;
  final TextInputAction? action;
  final ValueChanged<String>? onChange;
  final Color? filled;
  final String? prefix;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).appTheme;
    return TextFormField(
      focusNode: _focusNode,
      onChanged: widget.onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: widget.keyboard,
      autofocus: widget.autoFocus,
      autocorrect: widget.autoCorrect,
      cursorColor: appTheme.inputTheme.border.borderSide.color,
      textInputAction: widget.action,
      textAlignVertical: TextAlignVertical.center,
      obscuringCharacter: '*',
      onTapOutside: (_) => _focusNode.unfocus(),
      onFieldSubmitted: (v) {
        if (widget.action == TextInputAction.next) {
          _focusNode.nextFocus();
        } else {
          _focusNode.unfocus();
        }
      },
      style: appTheme.inputTheme.hintStyle,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
        hintText: widget.placeholder,
        hintStyle: appTheme.inputTheme.hintStyle,
        border: appTheme.inputTheme.border,
        enabledBorder: appTheme.inputTheme.border,
        focusedBorder: appTheme.inputTheme.border,
        focusedErrorBorder: appTheme.inputTheme.border,
        errorBorder: appTheme.inputTheme.border,
        contentPadding: EdgeInsets.all(12.h),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: widget.prefix != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: _getIcon(icon: widget.prefix!, size: 14),
              )
            : null,
      ),
    );
  }

  Widget _getIcon({required String icon, double size = 12}) {
    return CustomImage(
      imageUrl: icon,
      config: ImageConfig(
        height: size.h,
        width: size.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
