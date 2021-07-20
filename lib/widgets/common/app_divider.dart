import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const AppDivider({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 0,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color ?? Colors.transparent),
      ),
    );
  }
}
