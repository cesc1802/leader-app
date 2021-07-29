import 'package:flutter/material.dart';
import 'package:leader_app/features/home/widgets/category_item_widget.dart';
import 'package:leader_app/features/home/widgets/header_widget.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/body_wrapper.dart';
import 'package:leader_app/widgets/notify_item_widget.dart';
import 'package:leader_app/widgets/section_widget.dart';

class Fake {
  // title:
  // "Quyết định số: G33.23.23.001-981-21-000087\nsắp hết hạn phê duyệt ",
  // time: "10:03:13, 12/9/2020",
  Fake({
    required this.title,
    required this.time,
  });

  final String title;
  final String time;
}

// const kIntroSliderItems = [
//   SliderItem(
//     title: 'Thuận tiện tra cứu \nDễ dàng phê duyệt',
//     imageUrl: UIData.logo_1,
//   ),
//   SliderItem(
//     title: 'Giao diện thân thiện\nvới người dùng',
//     imageUrl: UIData.logo_1,
//   ),
//   SliderItem(
//     title: 'An toàn và bảo mật\nthông tin',
//     imageUrl: UIData.logo_1,
//   ),
// ];
var kNotiItem = [
  Fake(
    time: "10:03:13, 14/11/2020",
    title: "Quyết định số: G33.23.23.001-981-21-069096\nsắp hết hạn phê duyệt ",
  ),
  Fake(
    time: "10:03:13, 12/10/2020",
    title: "Quyết định số: G33.23.23.001-981-21-060906\nsắp hết hạn phê duyệt ",
  ),
  Fake(
    time: "10:03:13, 15/7/2020",
    title:
        "Quyết định số: G33.23.23.001-981-21-0060969\nsắp hết hạn phê duyệt ",
  ),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(brightness: Brightness.dark, toolbarHeight: 0),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    HeaderWidget(),
                    Gaps.vGap12,
                    BodyWrapper(
                      padding: EdgeInsets.symmetric(vertical: 28),
                      child: Column(
                        children: [
                          SectionWidget(
                            title: "Thông báo",
                            actionTitle: "Xem thêm",
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return NotifyItemWidget(
                                  title: kNotiItem[index].title,
                                  time: kNotiItem[index].time,
                                );
                              },
                              separatorBuilder: (_, __) => Gaps.vGap12,
                              itemCount: 3,
                            ),
                          ),
                          Gaps.vGap28,
                          SectionWidget(
                            title: "Danh mục",
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: _gotoDecisionListPage,
                                    child: GestureDetector(
                                      child: CategoryItemWidget(
                                        image: UIData.categoryImage3,
                                        title: "Phê duyệt quyết định",
                                      ),
                                    ),
                                  ),
                                  Gaps.hGap16,
                                  InkWell(
                                    onTap: _gotoHistoryApprovedDecision,
                                    child: CategoryItemWidget(
                                      image: UIData.historyApproved,
                                      title: "Lịch sử phê duyệt",
                                    ),
                                  ),
                                  Gaps.hGap16,
                                  CategoryItemWidget(
                                    image: UIData.categoryImage2,
                                    title: "Tra cứu công dân",
                                  ),
                                  Gaps.hGap16,
                                  CategoryItemWidget(
                                    image: UIData.categoryImage1,
                                    title: "Tra cứu phương tiện",
                                  ),
                                  Gaps.hGap16,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bodyColorV2,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _gotoDecisionListPageV2() {
    Navigator.of(context).pushNamed(RouteNames.decisionListV2);
  }

  void _gotoDecisionListPage() {
    Navigator.of(context).pushNamed(RouteNames.decisionList);
  }

  void _gotoHistoryApprovedDecision() {
    Navigator.of(context).pushNamed(RouteNames.historyApprovedDecision);
  }
}
