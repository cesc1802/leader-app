import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leader_app/features/home/widgets/category_list.dart';
import 'package:leader_app/features/home/widgets/category_title.dart';
import 'package:leader_app/features/home/widgets/home_title.dart';
import 'package:leader_app/features/home/widgets/search.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/common/decision_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: Dimens.gap_dp24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Xin chào, Admin",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
              CircleAvatar(
                child: Image.asset(UIData.logo_1),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Search(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorUtils.convertFromHexColor(hexColor: "#F3F2F8"),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Dimens.gap_dp24,
                  ),
                  topLeft: Radius.circular(
                    Dimens.gap_dp24,
                  ),
                ),
              ),
              child: Column(
                children: [
                  HomeTitle(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimens.gap_dp8,
                        left: Dimens.gap_dp16,
                        right: Dimens.gap_dp16,
                      ),
                      child: DecisionListView(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gap_dp16, right: Dimens.gap_dp16),
                      child: Column(
                        children: [
                          CategoryTitle(),
                          Gaps.vGap8,
                          Expanded(
                            child: CategoriesList(),
                          ),
                          Gaps.vGap16,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
