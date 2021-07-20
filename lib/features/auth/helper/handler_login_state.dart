import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:leader_app/utils/dialog_mixin.dart';

enum LoginState { success, newUser, fail }

abstract class HandleLoginState<T extends StatefulWidget> extends State<T>
    with DialogMixin {
  late bool isLoading;

  void handleLoginState(LoginState loginState, {bool isVerifiedPhone = false}) {
    switch (loginState) {
      case LoginState.success:
        // appStateBloc.getUserProfile(forLogin: true).then((u) {
        //   appStateBloc.notifyUserLoggedSuccessfully();
        // }).catchError((e) {
        //   print('e $e');
        // });
        //   appStateBloc.notifyUserLoggedSuccessfully();
        print('LoginState.success');
        break;
      case LoginState.newUser:
        // in case new user
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
