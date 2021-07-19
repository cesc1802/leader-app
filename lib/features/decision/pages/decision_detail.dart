import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/widgets/detail_decision_body.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/body_wrapper.dart';
import 'package:leader_app/widgets/button_text.dart';

class DecisionDetail extends StatefulWidget {
  const DecisionDetail({Key? key}) : super(key: key);

  @override
  _DecisionDetailState createState() => _DecisionDetailState();
}

class _DecisionDetailState extends State<DecisionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.decision_detail_header),
      ),
      body: Column(
        children: [
          Expanded(
            child: BodyWrapper(
              padding: const EdgeInsets.only(
                top: Dimens.gap_dp32,
                left: Dimens.gap_dp16,
                right: Dimens.gap_dp16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(UIData.decisionDetailIcon),
                        Column(
                          children: [
                            Text(
                              "Căn cứ biên bản VPHC số:",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              "G33.23.23.001-981-21-000087",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.vGap16,
                    DetailDecisionBody(),
                    Gaps.vGap28,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Xem chi tiết",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("xem chi tiết");
                              },
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "BB/QĐ Liên Quan",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 12,
                                      color: AppColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("BB/QĐ Liên Quan");
                              },
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap28,
                    SizedBox(
                      width: double.infinity,
                      child: ButtonText(
                        title: "Phê duyệt",
                        borderColor: Colors.white,
                        onPressed: () {},
                        textStyle:
                            Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    Gaps.vGap16,
                    SizedBox(
                      width: double.infinity,
                      child: ButtonText(
                        title: "Từ chối",
                        // borderColor: Colors.white,
                        backgroundColor: AppColors.secondaryColor,
                        onPressed: () {},
                        textStyle:
                            Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
