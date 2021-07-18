import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class NotifyItemWidget extends StatelessWidget {
  final String title;
  final String time;

  const NotifyItemWidget({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3!,
            textAlign: TextAlign.left,
          ),
          Gaps.vGap4,
          Text(
            time,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontSize: 8, color: AppColors.disableColor),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
