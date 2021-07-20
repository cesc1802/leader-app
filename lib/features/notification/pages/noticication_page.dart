import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Center(
        child: Text(
          "THIS SCREEN \nWILL BE DEVELOPED \nIN THE FUTURE",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
