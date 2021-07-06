import 'package:flutter/material.dart';
import 'package:leader_app/utils/ui_data.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                UIData.logo_1,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Text(
                "Thuận tiện tra cứu \nDễ dàng phê duyệt",
                // textAlign: TextAlign.center,
                // style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
