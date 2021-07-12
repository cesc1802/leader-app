import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final Color? borderColor;

  const ButtonText({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.padding,
    this.borderColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = borderColor != null
        ? MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.gap_dp8),
              side: BorderSide(
                width: 1,
                color: borderColor!,
              ),
            ),
          )
        : null;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding ??
              EdgeInsets.symmetric(
                horizontal: Dimens.gap_dp16,
                vertical: Dimens.gap_dp16,
              ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return backgroundColor;
        }),
        foregroundColor: MaterialStateProperty.all(textColor),
        shape: shape,
      ),
      child: Text(
        title,
        style: textStyle ??
            Theme.of(context).textTheme.headline5!.apply(
                color: backgroundColor != null ? AppColors.primaryColor : null),
      ),
    );
  }
}
