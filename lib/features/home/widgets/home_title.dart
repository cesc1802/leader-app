import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.gap_dp28,
        left: Dimens.gap_dp16,
        right: Dimens.gap_dp16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Thông báo",
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColors.primaryColor),
          ),
          Text(
            "Xem thêm",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                ),
          )
        ],
      ),
    );
  }
}
