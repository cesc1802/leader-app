import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

enum CustomTextFieldState { done, error }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.labelText,
    this.autoCorrect,
    this.obscureText,
    this.state,
    this.onChanged,
    this.keyboardType,
    this.errorMessage,
    this.controller,
    this.inputFmt,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  final String? labelText;
  final bool? obscureText;
  final bool? autoCorrect;
  final CustomTextFieldState? state;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? errorMessage;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFmt;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
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
        if (widget.labelText != null) Gaps.vGap8,
        TextFormField(
          onChanged: widget.onChanged,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: AppColors.textFieldColor),
          obscureText: widget.obscureText ?? false,
          cursorColor: AppColors.primaryColor,
          keyboardType: widget.keyboardType,
          autocorrect: widget.autoCorrect ?? false,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ],
    );
  }
}
