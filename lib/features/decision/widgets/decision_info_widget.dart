import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/rounded_icon_button.dart';

class DecisionInfoWidget extends StatefulWidget {
  @override
  _DecisionInfoWidgetState createState() => _DecisionInfoWidgetState();

  DecisionInfoWidget({
    required this.decision,
  });

  final Decision decision;
}

class _DecisionInfoWidgetState extends State<DecisionInfoWidget> {
  late double margin = 28;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Slidable(
        actionExtentRatio: 0.14,
        actionPane: SlidableDrawerActionPane(),
        actions: [
          RoundedIconButton(
            icon: Image.asset(UIData.acceptIcon, width: 16, height: 16),
            color: AppColors.primaryColor,
            onPressed: () {},
          ),
          // RoundedIconButton(
          //   icon: Image.asset(UIData.removeIcon, width: 16, height: 16),
          //   color: AppColors.secondaryColor,
          //   onPressed: () {},
          // ),
          // RoundedIconButton(
          //   icon: Image.asset(UIData.deleteIcon, width: 16, height: 16),
          //   color: AppColors.errorColor,
          //   onPressed: () {},
          // ),
        ],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.decisionItemBGColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // widget.decisionNumber,
                    widget.decision.decisionNumber,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 12),
                  ),
                  Text(
                    widget.decision.driverLicenseNumber,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 12),
                  )
                ],
              ),
              Gaps.vGap12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Người vi phạm ' + widget.decision.violatorName,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 8,
                        color: AppColors.decisionItemSubTitleColor),
                  ),
                  Text(
                    widget.decision.remainTime,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 8,
                        color: AppColors.decisionItemSubTitleColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
