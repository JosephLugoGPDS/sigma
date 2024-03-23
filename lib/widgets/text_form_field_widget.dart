import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigma/utils/color_util.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.textEditingController,
    this.hint,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.leftIcon,
    this.rightIcon,
    this.rightIconColor,
    this.onRightTap,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.borderRadius = 30,
    this.width,
    this.maxLines,
    this.hintColor,
    this.inputFormatters,
    this.initialValue,
    this.onTap,
    this.label,
    this.readOnly = false,
    this.isDense = true,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.styleLabel,
    this.style,
    this.hintStyle,
    this.disableBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.borderColor = ColorUtil.gray,
    this.margin,
    this.isLabelTitle = false,
    this.fillColor,
  });

  final TextEditingController? textEditingController;
  final String? hint;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? onRightTap;
  final void Function()? onTap;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double borderRadius;
  final double? width;
  final int? maxLines;
  final Color? hintColor;
  final Color? rightIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final InputBorder? disableBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? label;
  final bool readOnly;
  final bool isDense;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final TextStyle? styleLabel;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color borderColor;
  final Color? fillColor;
  final EdgeInsets? margin;
  final bool isLabelTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null && isLabelTitle)
            Text(
              label!,
              style: styleLabel ?? Theme.of(context).textTheme.titleMedium,
            ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            scrollPadding: EdgeInsets.zero,
            controller: textEditingController,
            keyboardType: keyboardType,
            onChanged: onChanged,
            onTap: onTap,
            textCapitalization: textCapitalization,
            readOnly: readOnly,
            onFieldSubmitted: onSubmitted,
            style: style ?? Theme.of(context).textTheme.titleMedium,
            textInputAction: textInputAction,
            obscureText: obscureText,
            cursorColor: ColorUtil.primaryAccent,
            maxLines: maxLines,
            initialValue: initialValue,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            validator: validator ??
                (String? value) {
                  return value!.isEmpty ? 'requerido' : null;
                },
            decoration: InputDecoration(
              filled: fillColor != null,
              focusColor: fillColor ?? borderColor,
              fillColor: fillColor,
              alignLabelWithHint: true,
              suffixIcon: GestureDetector(
                  onTap: onRightTap,
                  child: Icon(rightIcon, color: rightIconColor)),
              // labelText: label,
              floatingLabelStyle: styleLabel,
              hintStyle: hintStyle ?? Theme.of(context).textTheme.titleMedium,
              labelStyle: styleLabel ?? Theme.of(context).textTheme.titleMedium,
              prefixIcon: leftIcon != null
                  ? Icon(
                      leftIcon,
                      color: rightIconColor,
                    )
                  : null,
              border: InputBorder.none,
              hintText: hint,
              isDense: isDense,
              hintMaxLines: 1,
              label: label != null && !isLabelTitle
                  ? Text(
                      label!,
                      style:
                          styleLabel ?? Theme.of(context).textTheme.titleMedium,
                    )
                  : null,
              focusedErrorBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.2),
                  ),
              errorBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.2),
                  ),
              disabledBorder: disableBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.2),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.2),
                  ),
              focusedBorder: focusedBorder ??
                  const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorUtil.primary, width: 1.2),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
