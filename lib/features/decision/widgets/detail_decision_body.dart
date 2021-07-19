import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/button_text.dart';

class DetailDecisionBody extends StatelessWidget {
  const DetailDecisionBody({Key? key}) : super(key: key);

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
          // color: ColorUtils.convertFromHexColor(hexColor: "E6EAF7"),
          // color: AppColors.decisionDetailBodyColor,
          child: Column(
            children: [
              DetailDecisionBodyRow(
                leftText: "Ngày lập biên bản",
                rightText: "30/04/2021",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Người vi phạm",
                rightText: "Ngô Minh Phúc",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Ngày sinh",
                rightText: "06/09/1969",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Nơi ở hiện tại",
                rightText: "Đồng Quang, Quốc Oai,\nHà Nội",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Hình thức xử phạt",
                rightText: "Phạt tiền",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Hành vi vi phạm",
                rightText:
                    "Không chấp hành\nhiệu lệnh chỉ dẫn\ncủa vạch kẻ đường",
              ),
              Gaps.vGap12,
              DetailDecisionBodyRow(
                leftText: "Só tiện nộp phạt",
                rightText: "150.000 đ",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 12,
                color: AppColors.decisionDetailLabelTextColor,
              ),
        ),
        Text(
          rightText,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 15,
                color: AppColors.decisionDetailTextColor,
              ),
        ),
      ],
    );
  }
}
