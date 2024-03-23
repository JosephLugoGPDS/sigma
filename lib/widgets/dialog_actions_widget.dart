import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';
import 'package:sigma/widgets/button_widget.dart';
import 'package:sigma/widgets/dialog_widget.dart';

class DialogActionsWidget extends StatelessWidget {
  const DialogActionsWidget({
    super.key,
    required this.description,
    this.title,
    required this.rightTitle,
    this.leftAction,
    this.rightAction,
  });
  final String? title;
  final String description;
  final String rightTitle;
  final void Function()? leftAction;
  final void Function()? rightAction;

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      child: Container(
        width: 350,
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '¿Estás seguro?',
              style: const TextStyle(
                color: ColorUtil.black,
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 14 / 16,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: const TextStyle(
                color: ColorUtil.black,
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 18 / 16,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              runSpacing: 0,
              children: [
                ButtonWidget(
                  title: 'CANCELAR',
                  color: ColorUtil.gray,
                  onPressed: leftAction ?? () => Navigator.of(context).pop(),
                ),
                ButtonWidget(
                  color: ColorUtil.primaryAccent,
                  title: rightTitle,
                  onPressed: rightAction,
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
