import 'package:flutter/material.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/widgets/button_text.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text("App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildButton(context, RouteNames.welcome, "Welcome Page"),
            SizedBox(height: 16),
            _buildButton(context, RouteNames.authLogin, "Auth Page"),
            SizedBox(height: 16),
            _buildButton(
                context, RouteNames.decisionList, "List Decision Page"),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String routeName, String title) {
    return ButtonText(
      backgroundColor: Colors.blue,
      padding: EdgeInsets.zero,
      textStyle:
          Theme.of(context).textTheme.headline3!.apply(color: Colors.white),
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
      title: title,
    );
  }
}
