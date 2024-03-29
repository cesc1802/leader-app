import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? routeName;

  const ErrorPage({Key? key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for $routeName'),
      ),
    );
  }
}
