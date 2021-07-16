import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';

import 'decision_card_item.dart';

class DecisionListView extends StatelessWidget {
  const DecisionListView({
    Key? key,
    this.bgItemColor,
    this.onTap,
  }) : super(key: key);

  final Color? bgItemColor;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? null,
          child: DecisionCardItem(
            bgColor: bgItemColor,
          ),
        ),
        Gaps.vGap8,
        DecisionCardItem(
          bgColor: bgItemColor,
        ),
        Gaps.vGap8,
        DecisionCardItem(
          bgColor: bgItemColor,
        ),
      ],
    );
  }
}
