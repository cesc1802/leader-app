import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';

class DecisionCardItem extends StatelessWidget {
  const DecisionCardItem({
    Key? key,
    this.bgColor,
  }) : super(key: key);

  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.gap_dp16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.gap_dp12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "G33.23.23.001-981-21-000087",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                      ),
                ),
                Text(
                  "30G - 123.45",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Người vi phạm: Ngô Minh Đức",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color:
                            ColorUtils.convertFromHexColor(hexColor: "#766FA5"),
                        fontSize: 12,
                      ),
                ),
                Text(
                  "Còn 1 ngày",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color:
                            ColorUtils.convertFromHexColor(hexColor: "#766FA5"),
                        fontSize: 12,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
