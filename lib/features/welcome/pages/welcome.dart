import 'package:flutter/material.dart';
import 'package:leader_app/features/auth/pages/auth_screen.dart';
import 'package:leader_app/features/welcome/widgets/slider_intro.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/button_text.dart';

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

  void onPageChanged(int pageIndex) {
    setState(() {
      currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: Dimens.gap_dp16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IntroSlider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonText(
                    title: Strings.signInButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthScreen()),
                      );
                    },
                  ),
                  Gaps.vGap16,
                  ButtonText(
                    title: Strings.signUpTitle,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
