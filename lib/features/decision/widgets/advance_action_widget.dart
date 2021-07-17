import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/button_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AdvanceActionWidget extends StatefulWidget {
  @override
  _AdvanceActionWidgetState createState() => _AdvanceActionWidgetState();
}

class _AdvanceActionWidgetState extends State<AdvanceActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.gap_dp28,
        horizontal: Dimens.gap_dp28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  value: true,
                  fillColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primaryColor;
                      }
                      return AppColors.disableColor;
                    },
                  ),
                  onChanged: (value) {},
                ),
              ),
              Gaps.hGap8,
              Text(
                "Chọn",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
          GestureDetector(
            onTap: onClickAdvanceFilter,
            child: Row(
              children: [
                Image.asset(UIData.advanceFilterIcon),
                Gaps.hGap8,
                Text(
                  "Tìm kiếm nâng cao",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onClickAdvanceFilter() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SfDateRangePicker(
                  onSelectionChanged: null,
                  view: DateRangePickerView.month,
                  backgroundColor: Colors.white,
                  selectionMode: DateRangePickerSelectionMode.range,
                  selectionTextStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12, color: Colors.white),
                  selectionColor: AppColors.primaryColor,
                  startRangeSelectionColor: AppColors.primaryColor,
                  endRangeSelectionColor: AppColors.primaryColor,
                  rangeSelectionColor: AppColors.rangeSelectionColor,
                  headerHeight: 56,
                  rangeTextStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12),
                  headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gaps.vGap16,
              ButtonText(
                title: 'Áp dụng',
                onPressed: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
