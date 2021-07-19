import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/pages/decision_detail.dart';
import 'package:leader_app/features/decision/widgets/decision_title.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/widgets/common/custom_tabbar.dart';
import 'package:leader_app/widgets/common/decision_listview.dart';
import 'package:leader_app/widgets/common/page_header.dart';
import 'package:leader_app/widgets/common/seach_textbox.dart';

class ApprovedDecision extends StatelessWidget {
  const ApprovedDecision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.gap_dp16,
              right: Dimens.gap_dp16,
            ),
            child: PageHeader(
              header: Strings.decision_header,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.gap_dp16,
              right: Dimens.gap_dp16,
            ),
            child: SearchTextBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.gap_dp16,
              right: Dimens.gap_dp16,
            ),
            child: CustomTabBar(),
          ),
          Gaps.vGap16,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Dimens.gap_dp28,
                  ),
                  topLeft: Radius.circular(
                    Dimens.gap_dp28,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.gap_dp16,
                  left: Dimens.gap_dp16,
                  right: Dimens.gap_dp16,
                ),
                child: Column(
                  children: [
                    DecisionTitle(),
                    Gaps.vGap16,
                    DecisionListView(
                      bgItemColor: AppColors.decisionCardColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DecisionDetail(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
