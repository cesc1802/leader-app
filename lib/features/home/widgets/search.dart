import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      padding: EdgeInsets.fromLTRB(16, 16, 16, Dimens.gap_dp32),
      color: AppColors.primaryColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimens.gap_dp24),
        ),
        child: TextFormField(
          style: TextStyle(
            color: ColorUtils.convertFromHexColor(hexColor: "#333333"),
          ),
          decoration: InputDecoration(
            hintText: "Tìm kiếm nội dung",
            prefixIcon: Icon(
              Icons.search,
              color: ColorUtils.convertFromHexColor(hexColor: "#3754AF"),
            ),
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
    );
  }
}
