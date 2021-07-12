import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, this.labelText}) : super(key: key);

  final String? labelText;
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
            widget!.labelText ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ColorUtils.convertFromHexColor(hexColor: "#C1C7D0"),
                  fontSize: 12,
                ),
          ),
        Gaps.vGap8,
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Dimens.gap_dp8),
          ),
          child: TextFormField(
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
