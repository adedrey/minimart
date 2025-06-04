import 'package:flutter/widgets.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.decoration,
    this.width,
    this.height,
    this.constraints,
    this.behavior = HitTestBehavior.opaque,
    this.disabled = false,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.alignment,
    this.padding,
    this.margin,
    super.key,
  });
  final Widget child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BoxDecoration? decoration;
  final HitTestBehavior behavior;
  final bool disabled;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;
  final VoidCallback? onTapCancel;
  final AlignmentGeometry? alignment;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isTappedDown = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        behavior: widget.behavior,
        onTapDown: (tapDownDetails) {
          if (widget.disabled) {
            return;
          }
          setState(() {
            isTappedDown = true;
          });
          widget.onTapDown?.call();
        },
        onTapUp: (tapUpDetails) {
          setState(() {
            isTappedDown = false;
          });
          widget.onTapUp?.call();
        },
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });

          widget.onTapCancel?.call();
        },
        onTap: widget.disabled ? null : widget.onTap,
        onLongPress: widget.disabled ? null : widget.onLongPress,
        child: Opacity(
          opacity: isTappedDown ? 0.6 : 1.0,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: widget.padding,
            constraints: widget.constraints,
            margin: widget.margin,
            decoration: widget.decoration,
            alignment: widget.alignment,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
