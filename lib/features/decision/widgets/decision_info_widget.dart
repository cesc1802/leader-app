import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/widgets/rounded_icon_button.dart';

class DecisionInfoWidget extends StatefulWidget {
  @override
  _DecisionInfoWidgetState createState() => _DecisionInfoWidgetState();
}

class _DecisionInfoWidgetState extends State<DecisionInfoWidget> {
  final decisionId = "G33.23.23.001-981-21-000087";
  final decisionId2 = "49C1-399.95";
  final violatorName = "Ngô Minh Phúc";
  final remainTime = "Còn 1 ngày";

  late SlidableController slidableController;
  late double margin = 28;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.14,
      actionPane: SlidableDrawerActionPane(),
      actions: <Widget>[
        RoundedIconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          color: AppColors.primaryColor,
          onPressed: () {},
          padding: EdgeInsets.all(3),
        ),
        RoundedIconButton(
          icon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
          color: AppColors.secondaryColor,
          onPressed: () {},
          padding: EdgeInsets.all(3),
        ),
      ],
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
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
                  decisionId,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 12),
                ),
                Text(
                  decisionId2,
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
                  'Người vi phạm $violatorName',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 8, color: AppColors.decisionItemSubTitleColor),
                ),
                Text(
                  remainTime,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 8, color: AppColors.decisionItemSubTitleColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
