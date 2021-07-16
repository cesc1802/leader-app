import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class DecisionCardItem extends StatelessWidget {
  const DecisionCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.gap_dp16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.gap_dp12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quyết định số: ",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
            ),
            Text(
              "Trạng thái: ",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
            ),
            Text(
              "Ngày ra quyết định: ",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
            ),
            Text(
              "Tên người vi phạm: ",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
