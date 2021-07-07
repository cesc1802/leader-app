import 'package:flutter/material.dart';
import 'package:leader_app/features/welcome/widgets/splash_content.dart';
import 'package:leader_app/features/welcome/widgets/three_dot.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Map<String, String>> splashData = [
    {
      "text": "Thuận tiện tra cứu \nDễ dàng phê duyệt",
      "imgDir": UIData.logo_1,
    },
    {
      "text": "Thuận tiện tra cứu \nDễ dàng phê duyệt",
      "imgDir": UIData.logo_2,
    },
    {
      "text": "Thuận tiện tra cứu \nDễ dàng phê duyệt",
      "imgDir": UIData.logo_3,
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"] ?? "",
                          imgDir: splashData[index]["imgDir"] ?? "",
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => ThreeDot(
                                isCurrentIndex: currentPage == index,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.gap_dp12,
                              vertical: Dimens.gap_dp12,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(Strings.signInButton),
                                style: Theme.of(context).textButtonTheme.style,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.gap_dp12,
                              vertical: Dimens.gap_dp12,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(Strings.registerButton),
                                style: Theme.of(context)
                                    .textButtonTheme
                                    .style!
                                    .copyWith(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.primaryColor,
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
