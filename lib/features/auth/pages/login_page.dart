import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:leader_app/features/home/pages/home_page.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:leader_app/widgets/button_text.dart';
import 'package:leader_app/widgets/common/custom_textfield.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
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
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.all(Dimens.gap_dp28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.login_intro,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.primaryColor, fontSize: 24),
              ),
              Gaps.vGap24,
              Text(
                Strings.login_instruction,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.primaryColor, fontSize: 12),
              ),
              Gaps.vGap16,
              CustomTextField(
                  labelText: "Tài khoản",
                  obscureText: false,
                  onChanged: (value) {
                    // print(value);
                  }),
              Gaps.vGap16,
              CustomTextField(
                labelText: "Mật khẩu",
                obscureText: true,
                onChanged: (value) {
                  // print(value);
                },
              ),
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
                      inactiveColor:
                          ColorUtils.convertFromHexColor(hexColor: "#C1C7D0"),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              Gaps.vGap24,
              RichText(
                text: TextSpan(
                  text: Strings.login_forgot_password,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 12, color: AppColors.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print(Strings.login_forgot_password);
                    },
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.vGap24,
              RichText(
                text: TextSpan(
                  text: Strings.login_no_account,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12, color: AppColors.primaryColor),
                  children: [
                    TextSpan(
                      text: Strings.login_register,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(Strings.login_register);
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
