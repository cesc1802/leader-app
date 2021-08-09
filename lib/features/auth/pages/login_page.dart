import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/features/auth/blocs/login_bloc.dart';
import 'package:leader_app/features/auth/helper/login_state_helper.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/utils/utils.dart';
import 'package:leader_app/widgets/button_text.dart';
import 'package:leader_app/widgets/common/app_loading.dart';
import 'package:leader_app/widgets/common/custom_switch_button.dart';
import 'package:leader_app/widgets/custom_textfield.dart';
import 'package:leader_app/widgets/title_appbar_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends LoginStateHelper<AuthScreen> {
  final loginBloc = LoginBloc();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: loginBloc.isLoadingStream,
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
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: AppColors.primaryColor, fontSize: 24),
                      ),
                      Gaps.vGap24,
                      Text(
                        Strings.login_instruction,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: AppColors.primaryColor, fontSize: 12),
                      ),
                      Gaps.vGap16,
                      StreamBuilder(
                          stream: loginBloc.userNameStream,
                          builder: (context, snapshot) {
                            return CustomTextField(
                              labelText: Strings.login_account_label,
                              obscureText: false,
                              // errorMessage: snapshot.error ?? "",
                              prefixIcon: Image.asset(UIData.userIcon),
                              onChanged: loginBloc.onUserNameChanged,
                            );
                          }),
                      Gaps.vGap16,
                      StreamBuilder(
                          stream: loginBloc.pwdStream,
                          builder: (context, snapshot) {
                            return CustomTextField(
                              labelText: Strings.login_password_label,
                              obscureText: _isObscure,
                              prefixIcon: Image.asset(UIData.lockIcon),
                              suffixIcon: InkWell(
                                onTap: _showPassWord,
                                child: Image.asset(UIData.showIcon),
                              ),
                              onChanged: loginBloc.onPasswordChanged,
                            );
                          }),
                      Gaps.vGap32,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.login_save_account,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: AppColors.disableColor,
                                    fontSize: 12),
                          ),
                          CustomSwitch(
                            initValue: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Gaps.vGap32,
                      StreamBuilder(
                          stream: loginBloc.validLogin,
                          builder: (context, snapshot) {
                            var val = true;
                            if (snapshot.data == null ||
                                snapshot.data == false) {
                              val = false;
                            }
                            return ButtonText(
                              title: Strings.signInButton,
                              borderColor: Colors.white,
                              onPressed: val ? _handleLogin : null,
                            );
                          }),
                      Gaps.vGap24,
                      RichText(
                        text: TextSpan(
                          text: Strings.login_forgot_password,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 12, color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print(Strings.login_forgot_password);
                            },
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gaps.vGap24,
                      // RichText(
                      //   text: TextSpan(
                      //     text: Strings.login_no_account,
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .headline1!
                      //         .copyWith(fontSize: 12, color: AppColors.primaryColor),
                      //     children: [
                      //       TextSpan(
                      //         text: Strings.login_register,
                      //         style: Theme.of(context).textTheme.headline1!.copyWith(
                      //               fontSize: 12,
                      //               color: AppColors.primaryColor,
                      //               decoration: TextDecoration.underline,
                      //             ),
                      //         recognizer: TapGestureRecognizer()
                      //           ..onTap = () {
                      //             print(Strings.login_register);
                      //           },
                      //       ),
                      //     ],
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> _handleLogin() async {
    Utils.setLoadingStyleAppSystemUI();
    try {
      final res = await loginBloc.loginUserNameWithPwd();
      handleLoginState(res);
    } catch (e) {
      showErrorMessage(
        'Tài khoản không tồn tại hoặc mật khẩu không đúng.'
        ' Xin vui lòng thử lại',
      );
    }
  }

  void _showPassWord() {
    setState(() {
      _isObscure = !_isObscure;
      Future.delayed(Duration(milliseconds: 1500))
          .whenComplete(() => setState(() {
                _isObscure = true;
              }));
    });
  }
}
