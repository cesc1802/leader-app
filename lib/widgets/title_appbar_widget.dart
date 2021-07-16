import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/rounded_icon_button.dart';

class TitleAppBarWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? action;
  final String? title;

  const TitleAppBarWidget({
    Key? key,
    this.padding,
    this.leading,
    this.action,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: Dimens.gap_dp16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ??
              RoundedIconButton(
                padding: EdgeInsets.all(8),
                icon: Image.asset(UIData.backIcon),
                onPressed: () => _handleLeadingPressed(context),
              ),
          Expanded(
            child: Column(
              children: [
                _buildTitle(context),
              ],
            ),
          ),
          action ??
              RoundedIconButton(
                padding: EdgeInsets.all(8),
                icon: Icon(Icons.clear, color: Colors.transparent),
              ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return title != null
        ? Text(
            title!,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          )
        : SizedBox();
  }

  void _handleLeadingPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}
