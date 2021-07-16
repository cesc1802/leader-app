import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(color: AppColors.primaryColor, fontSize: 12),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.gap_dp16,
          vertical: Dimens.gap_dp12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.gap_dp28),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.gap_dp28),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintText: "Tìm kiếm nội dung",
        prefixIcon: Icon(
          Icons.search,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 36,
        ),
      ),
    );
  }
}
