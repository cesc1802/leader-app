import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';

enum CustomTextFieldState { done, error }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.labelText,
    this.autoCorrect,
    this.obscureText,
    this.state,
    required this.onChanged,
    this.keyboardType,
    this.errorMessage,
    this.controller,
    this.inputFmt,
  }) : super(key: key);

  final String? labelText;
  final bool? obscureText;
  final bool? autoCorrect;
  final CustomTextFieldState? state;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final String? errorMessage;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFmt;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final normalBorder = Border.all(color: AppColors.primaryColor, width: 1);
    final doneBorder = Border.all(color: AppColors.primaryColor, width: 1);
    final errorBorder = Border.all(color: AppColors.primaryColor, width: 1);

    var border = normalBorder;
    Widget suffixIcon;
    if (widget.state == CustomTextFieldState.done) {
      border = doneBorder;
      suffixIcon = Icon(
        FontAwesomeIcons.check,
        color: AppColors.primaryColor,
        size: 16,
      );
    } else if ((widget.state != null &&
        widget.state == CustomTextFieldState.error)) {
      border = errorBorder;
      suffixIcon = Icon(
        Icons.clear,
        color: AppColors.primaryColor,
        size: 16,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? '',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColors.primaryColor),
          ),
        Gaps.vGap8,
        Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(Dimens.gap_dp8),
          ),
          child: TextFormField(
            onChanged: widget.onChanged,
            style: TextStyle(
              color: AppColors.textFieldColor,
            ),
            obscureText: widget.obscureText ?? false,
            cursorColor: AppColors.primaryColor,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autoCorrect ?? false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                top: Dimens.gap_dp28,
                left: Dimens.gap_dp16,
                right: Dimens.gap_dp16,
                bottom: -Dimens.gap_dp4,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
