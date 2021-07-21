import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leader_app/utils/dialog_mixin.dart';
import 'package:leader_app/utils/utils.dart';

enum DecisionState { success, fail }

abstract class DecisionStateHelper<T extends StatefulWidget> extends State<T>
    with DialogMixin {
  late bool isLoading;

  void handleDecisionState(DecisionState state) async {
    switch (state) {
      case DecisionState.success:
        Utils.setStyleAppSystemUI();
        setState(() {
          isLoading = false;
        });
        break;
      case DecisionState.fail:
        setState(() {
          isLoading = false;
        });
        showErrorMessage('Đã có lỗi xảy ra, xin vui lòng thử lại');
        break;
    }
  }

  void handleError(PlatformException e) {
    setState(() {
      isLoading = false;
    });
    if (e.code != 'ERROR_ABORTED_BY_USER') {
      showErrorMessage(e.message ?? '');
    }
  }
}
