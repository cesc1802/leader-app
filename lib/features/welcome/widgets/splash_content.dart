import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.imgDir,
  }) : super(key: key);

  final String text;
  final String imgDir;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgDir,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
