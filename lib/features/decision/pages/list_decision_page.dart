import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/blocs/decision_bloc.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/features/decision/widgets/advance_action_widget.dart';
import 'package:leader_app/features/decision/widgets/decision_info_widget.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/custom_snackbar/custom_snack_bar.dart';
import 'package:leader_app/utils/custom_snackbar/top_snack_bar.dart';
import 'package:leader_app/utils/utils.dart';
import 'package:leader_app/widgets/common/app_loading.dart';
import 'package:leader_app/widgets/search_input_widget.dart';
import 'package:leader_app/widgets/title_appbar_widget.dart';

class ListDecisionPage extends StatefulWidget {
  @override
  _ListDecisionPageState createState() => _ListDecisionPageState();
}

class _ListDecisionPageState extends DecisionStateHelper<ListDecisionPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // final ScrollController _scrollController = ScrollController();

  final decisionBloc = DecisionBloc();
  var _isLoadMore = false;

  @override
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      if (tabController.index == 6) {
        tabController.animateTo(5);
      }
    });

    // _scrollController..addListener(decisionBloc.setLoadMoreListener);

    decisionBloc.dispatcher(
      DecisionBlocEvent(DecisionAction.GetList, 1),
    );
    fetchListDecision02();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //logic?
  void fetchListDecision02() async {
    await decisionBloc.dispatcher(
      DecisionBlocEvent(DecisionAction.GetList, 1),
    );
    // Utils.setLoadingStyleAppSystemUI();
    // setState(() {
    //   isLoading = true;
    // });
    // try {
    //   var res = await decisionBloc.getListDecision(1, 7);
    //   handleDecisionState(res);
    // } on DioError catch (e) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   showErrorMessage(
    //     e.message,
    //   );
    // } finally {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }

  //ở ây cũng vậy.
  // chỗ này em call api lấy list decision đây ạ. Anh nhớ là bloc thuần nó có líst event
  void handleApprovedDecision(int id) async {
    // decisionBloc.addEvent(handleApprovedDecision(id)) //dai loai vay. Con chi teit thi anh
    //ko nho, anh chán bloc lắm =]]. a đang dùng partten nào ạ. getx.
    // ý là chỗ này em sẽ tạo ra 1 list action type. xong rồi sink các action type. còn call api như nào bloc nó xử ạ.
    Utils.setLoadingStyleAppSystemUI();
    try {
      var res = await decisionBloc.approvedDecision(id);
      handleDecisionState(res);
    } on DioError catch (e) {
      showErrorMessage(
        e.message,
      );
    }
  }

  //logic?
  void findDecisionByDecisionNum() async {
    Utils.setLoadingStyleAppSystemUI();

    try {
      var res = await decisionBloc.getDecisionByDecisionNum();
      handleDecisionState(res);
    } on DioError catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: "không tìm thấy số quyết định",
        ),
      );
    }
  }

  @override
  void dispose() {
    decisionBloc.dispose();
    tabController.dispose();
    // _scrollController.removeListener(decisionBloc.setLoadMoreListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: decisionBloc,
      child: StreamBuilder<bool>(
          stream: decisionBloc.isLoadingStream,
          builder: (context, snapshot) {
            return AppLoading(
              isLoading: snapshot.data ?? false,
              child: Scaffold(
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
                        child: StreamBuilder<String?>(
                            stream: decisionBloc.queryDecisionStream,
                            builder: (context, snapshot) {
                              return SearchInputWidget(
                                onChanged: decisionBloc.onQueryChange,
                                doSearch: findDecisionByDecisionNum,
                              );
                            }),
                      ),
                      Gaps.vGap16,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: AppColors.tabUnderLineColor),
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
                                text: "Quyết định 18",
                              ),
                              Tab(
                                text: "Quyết định 20",
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
                                  children: [
                                    StreamBuilder<List<Decision>>(
                                        stream: decisionBloc.outDecisions,
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData)
                                            return SizedBox();
                                          final List<Decision> decisions =
                                              snapshot.data!;
                                          // final Paging paging = snapshot.data!.paging;
                                          return Container(
                                            child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return DecisionInfoWidget(
                                                  decision: decisions[index],
                                                  onPressed: () =>
                                                      handleApprovedDecision(
                                                    decisions[index].decisionId,
                                                  ),
                                                );
                                              },
                                              controller:
                                                  decisionBloc.scrollController,
                                              itemCount: decisions.length,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      Gaps.vGap16,
                                            ),
                                          );
                                        }),
                                    Container(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return Text("data");
                                        },
                                        itemCount: 1000,
                                        separatorBuilder: (context, index) =>
                                            Gaps.vGap16,
                                      ),
                                    ),
                                    Container(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return Text("data");
                                        },
                                        itemCount: 1000,
                                        separatorBuilder: (context, index) =>
                                            Gaps.vGap16,
                                      ),
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
              ),
            );
          }),
    );
  }
}
