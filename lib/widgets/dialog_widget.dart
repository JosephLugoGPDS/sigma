import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.child,
    this.onTap,
    this.onTapClosed,
    this.showIconClose = true,
    this.contentPadding,
    this.height,
    this.width,
  });

  final Widget child;
  final void Function()? onTap;
  final void Function()? onTapClosed;
  final bool showIconClose;
  final EdgeInsets? contentPadding;
  final double? width;
  final double? height;

  static const onPressedThemeDialog = Key('onPressedThemeDialog');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorUtil.white,
      alignment: Alignment.center,
      buttonPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      insetPadding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      content: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            showIconClose
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      key: onPressedThemeDialog,
                      onPressed:
                          onTapClosed ?? () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        color: ColorUtil.gray,
                      ),
                    ),
                  )
                : const SizedBox(),
            child,
          ],
        ),
      ),
    );
  }
}
