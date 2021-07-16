import 'package:flutter/material.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.home_category,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
