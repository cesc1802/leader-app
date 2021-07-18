import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/widgets/advance_action_widget.dart';
import 'package:leader_app/features/decision/widgets/decision_info_widget.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/widgets/search_input_widget.dart';
import 'package:leader_app/widgets/title_appbar_widget.dart';

class ListDecisionPage extends StatefulWidget {
  @override
  _ListDecisionPageState createState() => _ListDecisionPageState();
}

class _ListDecisionPageState extends State<ListDecisionPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 7);
    tabController.addListener(() {
      if (tabController.index == 6) {
        tabController.animateTo(5);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: TitleAppBarWidget(),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                Strings.approve_decision,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 24, color: Colors.white),
              ),
            ),
            Gaps.vGap16,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: SearchInputWidget(),
            ),
            Gaps.vGap16,
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.tabUnderLineColor),
                ),
              ),
              child: Theme(
                data: ThemeData().copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.disableColor,
                  isScrollable: true,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.tabIndicatorColor,
                  labelPadding: EdgeInsets.only(left: 28),
                  indicatorPadding: EdgeInsets.only(left: 28),
                  tabs: [
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "Quyết định 02",
                    ),
                    Tab(
                      text: "",
                    ),
                  ],
                ),
              ),
            ),
            Gaps.vGap28,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    AdvanceActionWidget(),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: <Widget>[
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return DecisionInfoWidget();
                              },
                              itemCount: 1000,
                              separatorBuilder: (context, index) => Gaps.vGap16,
                            ),
                          ),
                          Center(
                            child: Text("It's sunny here"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
