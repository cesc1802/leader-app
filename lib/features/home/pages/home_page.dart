import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/utils/ui_data.dart';

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
          Container(
            width: double.infinity,
            height: 85,
            padding: EdgeInsets.fromLTRB(16, 16, 16, Dimens.gap_dp32),
            color: AppColors.primaryColor,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimens.gap_dp24),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ColorUtils.convertFromHexColor(hexColor: "#333333"),
                ),
                decoration: InputDecoration(
                  hintText: "Tìm kiếm nội dung",
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorUtils.convertFromHexColor(hexColor: "#3754AF"),
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: Dimens.gap_dp28,
                    left: Dimens.gap_dp16,
                    right: Dimens.gap_dp16,
                    bottom: -Dimens.gap_dp4,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimens.gap_dp28,
                      left: Dimens.gap_dp16,
                      right: Dimens.gap_dp16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thông báo",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        Text(
                          "Xem thêm",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 12,
                                  ),
                        )
                      ],
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
