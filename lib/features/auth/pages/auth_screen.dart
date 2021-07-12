import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.gap_dp28),
                      topLeft: Radius.circular(Dimens.gap_dp28),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Text(
          //   Strings.authIntro,
          //   style: Theme.of(context).textTheme.bodyText2,
          // )
        ],
      ),
    );
  }
}
