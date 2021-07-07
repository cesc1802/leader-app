import 'package:flutter/material.dart';
import 'package:leader_app/themes/app_colors.dart';

class ThreeDot extends StatelessWidget {
  const ThreeDot({
    Key? key,
    required this.isCurrentIndex,
  }) : super(key: key);

  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.only(right: 5),
      width: isCurrentIndex ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
