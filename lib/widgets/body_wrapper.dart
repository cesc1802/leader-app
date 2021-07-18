import 'package:flutter/material.dart';
import 'package:leader_app/themes/app_colors.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  const BodyWrapper({
    Key? key,
    required this.child,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color ?? AppColors.bodyColorV2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: child,
    );
  }
}
