import 'package:flutter/material.dart';
import 'package:leader_app/features/auth/pages/login_page.dart';
import 'package:leader_app/features/auth/widgets/slider_intro.dart';
import 'package:leader_app/flavor_config.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/widgets/button_text.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IntroSlider(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.gap_dp16),
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
                    // ButtonText(
                    //   title: Strings.registerButton,
                    //   backgroundColor: Colors.white,
                    //   borderColor: AppColors.primaryColor,
                    // ),
                  ],
                ),
              ),
            ),
            Text(
              "Version: " + FlavorConfig.instance!.values.appVer,
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12),
            ),
            Gaps.vGap24,
          ],
        ),
      ),
    );
  }
}
