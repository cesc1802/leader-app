import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

enum CustomTextFieldStyle { done, error }

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final CustomTextFieldStyle? style;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? autoCorrect;
  final String? errorMessage;
  final bool? obscureText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.initValue,
    this.style,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.autoCorrect,
    this.errorMessage,
    this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? focus;
  TextEditingController? internalController;

  bool isFocus = false;

  @override
  void initState() {
    super.initState();

    isFocus = false;
    focus = FocusNode();
    focus!.addListener(_onFocusChange);

    internalController = TextEditingController(text: widget.initValue);
  }

  void _onFocusChange() {
    if ((!isFocus && focus!.hasFocus) || (isFocus && !focus!.hasFocus)) {
      print("Focus Change ${focus!.hasFocus}");
      setState(() {
        isFocus = focus!.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    internalController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final normalBorder = Border.all(color: AppColors.primaryColor, width: 1);
    final doneBorder = Border.all(color: AppColors.primaryColor, width: 1);
    final errorBorder = Border.all(color: AppColors.primaryColor, width: 1);

    var border = normalBorder;
    Widget suffixIcon;
    if ((widget.style == CustomTextFieldStyle.done &&
        widget.errorMessage == null)) {
      border = doneBorder;
      suffixIcon = Icon(
        FontAwesomeIcons.check,
        color: AppColors.primaryColor,
        size: 16,
      );
    } else if ((widget.style != null &&
            widget.style == CustomTextFieldStyle.error) ||
        (widget.errorMessage != null)) {
      border = errorBorder;
      suffixIcon = Icon(
        Icons.clear,
        color: AppColors.primaryColor,
        size: 16,
      );
    }

    final currentController = widget.controller ?? internalController;
    var alignRow = CrossAxisAlignment.center;
    if (widget.labelText != null) {
      if (isFocus || currentController!.text.isNotEmpty) {
        alignRow = CrossAxisAlignment.end;
      } else {
        alignRow = CrossAxisAlignment.center;
      }
    }

    var labelStyle = Theme.of(context).textTheme.bodyText1;
    if (isFocus) {
      labelStyle = labelStyle!.apply(color: AppColors.primaryColor);
    } else {
      labelStyle = labelStyle!.apply(color: AppColors.primaryColor);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 58,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(Dimens.gap_dp8),
          ),
          child: Row(
            crossAxisAlignment: alignRow,
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: focus,
                  inputFormatters: widget.inputFormatters,
                  autocorrect: widget.autoCorrect ?? false,
                  controller: widget.controller ?? internalController,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChanged,
                  obscureText: widget.obscureText ?? false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: Dimens.gap_dp28,
                      left: Dimens.gap_dp16,
                      right: Dimens.gap_dp16,
                      bottom: -Dimens.gap_dp4,
                    ),
                    // labelText: widget.labelText,
                    hintText: widget.hintText,
                    labelStyle: labelStyle,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              widget.style != null || widget.errorMessage != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.gap_dp12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // suffixIcon,
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        widget.errorMessage != null ? Gaps.vGap4 : SizedBox(),
        _buildErrorMessage(),
      ],
    );
  }

  Widget _buildErrorMessage() {
    final textTheme = Theme.of(context).textTheme;

    // if (widget.errorMessage!.isEmpty) {
    //   return SizedBox();
    // }
    return SizedBox();

    final errorTextStyle = textTheme.caption!.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
      fontSize: 12,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.gap_dp16),
      child: Text(
        widget.errorMessage ?? '',
        style: errorTextStyle,
      ),
    );
  }
}
