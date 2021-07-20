import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leader_app/blocs/app_state_bloc.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:leader_app/utils/utils.dart';

import '../../../blocs/bloc_provider.dart';
import '../../../utils/dialog_mixin.dart';
import 'handler_login_state.dart';

abstract class LoginStateHelper<T extends StatefulWidget> extends State<T>
    with DialogMixin {
  late bool isLoading;

  void handleLoginState(LoginState loginState,
      {bool isVerifiedPhone = false}) async {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);

    switch (loginState) {
      case LoginState.success:
        Utils.setStyleAppSystemUI();
        await appStateBloc.notifyUserLoggedSuccessfully();
        Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNames.navBottom, (Route<dynamic> route) => false);
        break;
      case LoginState.newUser:
        break;
      case LoginState.fail:
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
