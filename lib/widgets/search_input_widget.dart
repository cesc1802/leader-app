import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class SearchInputWidget extends StatelessWidget {
  SearchInputWidget({
    Key? key,
    this.onChanged,
    required this.doSearch,
  });

  final ValueChanged<String>? onChanged;
  final Function() doSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.headline2!.copyWith(
            color: AppColors.primaryColor,
            fontSize: 12,
          ),
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
        hintStyle: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: AppColors.disableColor, fontSize: 12),
        // prefixIcon: Icon(
        //   Icons.search,
        // ),
        suffixIcon: InkWell(
          onTap: doSearch,
          child: Icon(
            Icons.search,
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 36,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 36,
        ),
      ),
    );
  }
}
