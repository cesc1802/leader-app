import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/widgets/button_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: Dimens.gap_dp16),
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
              top: 100,
              right: Dimens.gap_dp16,
              left: Dimens.gap_dp16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Strings.authInstruction,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.primaryColor, fontSize: 12),
                  ),
                  Gaps.vGap16,
                  _buildTaiKhoan(context),
                  Gaps.vGap16,
                  _buildMatKhau(context),
                  Gaps.vGap32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lưu đăng nhập",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: ColorUtils.convertFromHexColor(
                                  hexColor: "#C1C7D0"),
                              fontSize: 12,
                            ),
                      ),
                      FlutterSwitch(
                          inactiveColor: ColorUtils.convertFromHexColor(
                              hexColor: "#C1C7D0"),
                          toggleColor: Colors.white,
                          activeColor: AppColors.primaryColor,
                          value: false,
                          width: 40.0,
                          height: 20.0,
                          // valueFontSize: 50.0,
                          toggleSize: 5.0,
                          // borderRadius: 150.0,
                          padding: 8.0,
                          onToggle: (val) {})
                    ],
                  ),
                  Gaps.vGap32,
                  ButtonText(
                    title: Strings.signInButton,
                    borderColor: Colors.white,
                  ),
                  Gaps.vGap16,
                  ButtonText(
                    title: "Quên mật khẩu ?",
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12, color: AppColors.primaryColor),
                  ),
                  ButtonText(
                    title: "Chưa có tài khoản? Đăng ký",
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaiKhoan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tài khoản",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: ColorUtils.convertFromHexColor(hexColor: "#C1C7D0"),
              fontSize: 12),
        ),
        Gaps.vGap8,
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Dimens.gap_dp8),
          ),
          child: TextFormField(
            decoration: InputDecoration(
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
      ],
    );
  }

  Widget _buildMatKhau(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mật khẩu",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: ColorUtils.convertFromHexColor(hexColor: "#C1C7D0"),
              fontSize: 12),
        ),
        Gaps.vGap8,
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Dimens.gap_dp8),
          ),
          child: TextFormField(
            decoration: InputDecoration(
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
      ],
    );
  }
}
