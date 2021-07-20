import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/widgets/common/auto_hide_keyboard.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AutoHideKeyboard(child: child),
        if (isLoading)
          Container(
            color: const Color.fromRGBO(0, 0, 0, 0.5),
            child: const Center(
              child: CupertinoActivityIndicator(radius: 16),
            ),
          ),
      ],
    );
  }
}
