import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/widgets/icon_text.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/utils/ui_data.dart';

class DecisionTitle extends StatelessWidget {
  const DecisionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconText(
          icon: Image.asset(
            UIData.selectedIcon,
            width: 20,
            height: 20,
          ),
          text: Strings.decision_title_select,
        ),
        IconText(
          icon: Image.asset(
            UIData.searchAdvancedIcon,
            width: 20,
            height: 20,
          ),
          text: Strings.decision_title_advanced_search,
        ),
        // _buildRightText(context),
      ],
    );
  }
}
