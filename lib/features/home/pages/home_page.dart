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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
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
                                title:
                                    "Quyết định số: G33.23.23.001-981-21-000087\nsắp hết hạn phê duyệt ",
                                time: "10:03:13, 12/9/2020",
                              );
                            },
                            separatorBuilder: (_, __) => Gaps.vGap12,
                            itemCount: 3),
                      ),
                      Gaps.vGap28,
                      SectionWidget(
                        title: "Danh mục",
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
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
                              InkWell(
                                onTap: _gotoDecisionListPageV2,
                                child: GestureDetector(
                                  child: CategoryItemWidget(
                                    image: UIData.categoryImage3,
                                    title: "Phê duyệt quyết định",
                                  ),
                                ),
                              ),
                              Gaps.hGap16,
                              CategoryItemWidget(
                                image: UIData.categoryImage3,
                                title: "Lịch sử phê duyệt",
                              ),
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
    );
  }

  void _gotoDecisionListPageV2() {
    Navigator.of(context).pushNamed(RouteNames.decisionListV2);
  }

  void _gotoDecisionListPage() {
    Navigator.of(context).pushNamed(RouteNames.decisionList);
  }
}
