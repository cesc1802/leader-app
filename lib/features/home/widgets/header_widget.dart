import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/search_input_widget.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: Strings.welcomeMessage,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 26, color: Colors.white),
                  children: [
                    TextSpan(
                      text: "Admin",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.asset(
                UIData.userAvatar,
              ),
            ],
          ),
          Gaps.vGap16,
          SearchInputWidget(),
        ],
      ),
    );
  }
}
