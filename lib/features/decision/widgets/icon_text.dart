import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Image icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Gaps.hGap8,
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColors.primaryColor,
              ),
        )
      ],
    );
  }
}
