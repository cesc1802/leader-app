import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final Widget? actionWidget;
  final Function()? onActionClick;
  final Widget? spacer;
  final Widget child;
  final EdgeInsets? padding;

  const SectionWidget({
    Key? key,
    required this.title,
    required this.child,
    this.actionTitle,
    this.onActionClick,
    this.actionWidget,
    this.spacer,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleTitle = Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(fontSize: 17, color: AppColors.primaryColor);

    final styleAction = Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(fontSize: 14, color: AppColors.primaryColor);
    ;

    final _titleWidget = Text(title, style: styleTitle);

    final _actionWidget = actionTitle != null
        ? GestureDetector(
            onTap: onActionClick,
            child: Text(actionTitle!, style: styleAction),
          )
        : SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleWidget,
              _actionWidget,
            ],
          ),
        ),
        spacer ?? Gaps.vGap12,
        child,
      ],
    );
  }
}
