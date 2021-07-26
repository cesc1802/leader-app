import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/button_text.dart';

class DetailDecisionBody extends StatelessWidget {
  const DetailDecisionBody({
    Key? key,
    required this.decision,
  }) : super(key: key);

  final DetailDecisionResponse decision;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorUtils.convertFromHexColor(hexColor: "#E6EAF7"),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.gap_dp16),
        child: Container(
          child: Column(
            children: [
              DetailDecisionBodyRow(
                leftText: "Ngày lập biên bản",
                rightText: decision.decisionDate,
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Người vi phạm",
                rightText: decision.violatorName,
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Ngày sinh",
                rightText: "06/09/1969",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Nơi ở hiện tại",
                rightText: decision.violatorAddress,
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Hình thức xử phạt",
                rightText: decision.additional,
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Hành vi vi phạm",
                rightText: decision.violationBehavior
                    .replaceAll(RegExp("; "), ";\n")
                    .trim(),
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Số tiện nộp phạt",
                rightText: NumberFormat.currency(
                  locale: 'vi',
                  symbol: "Đ",
                ).format(
                  decision.totalAmount,
                ), //decision.totalAmount.toString(),
              ),
              Gaps.vGap12,
              Divider(),
              SeeMoreButton(
                icon: Image.asset(UIData.downArrowIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Image icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonText(
          title: "Xem thêm",
          backgroundColor: ColorUtils.convertFromHexColor(hexColor: "#E6EAF7"),
          textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        icon
      ],
    );
  }
}

class DetailDecisionBodyRow extends StatelessWidget {
  const DetailDecisionBodyRow({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                leftText,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 12,
                      color: AppColors.decisionDetailLabelTextColor,
                    ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                rightText,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 14,
                      color: AppColors.decisionDetailTextColor,
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
