import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    this.color,
    this.isOutline = false,
    this.onPressed,
    this.isPrincipal = false,
    this.padding,
    this.fontSize,
    this.height,
    this.width,
  });
  final String title;
  final Color? color;
  final bool isOutline;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final bool isPrincipal;
  final double? fontSize;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width ?? 0,
        minHeight: height ?? 0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: width != null
              ? EdgeInsets.zero
              : (padding ??
                  (isPrincipal
                      ? const EdgeInsets.only(
                          left: 42.0, right: 42.0, top: 15.0, bottom: 15.0)
                      : const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0, bottom: 8.0))),
          backgroundColor: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            side: isOutline
                ? BorderSide(
                    color: color ?? ColorUtil.white,
                    width: 1.0,
                  )
                : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isOutline ? color : ColorUtil.white,
            ),
          ),
        ),
      ),
    );
  }
}
