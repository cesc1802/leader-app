import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/widgets/common/app_divider.dart';
import 'package:leader_app/widgets/rounded_icon_button.dart';
import 'package:leader_app/widgets/title_appbar_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

mixin DialogMixin<T extends StatefulWidget> on State<T> {
  void showAddToCartDialog() {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.gap_dp24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimens.gap_dp24),
          ),
        ),
        child: Column(
          children: [
            Gaps.vGap16,
            TitleAppBarWidget(
              padding: EdgeInsets.zero,
              leading: RoundedIconButton(
                padding: EdgeInsets.all(8),
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: "Add Item",
            ),
            AppDivider(color: Colors.white, height: 1),
          ],
        ),
      ),
    );
  }

  Future<T?> showErrorMessage(String content) {
    return showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text('Lỗi'),
        ),
        content: Text(content),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}
