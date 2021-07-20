import 'package:flutter/material.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/auth/helper/handler_login_state.dart';
import 'package:leader_app/features/auth/services/app_auth_services.dart';
import 'package:leader_app/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with Validators {
  final _userNameCtrl = BehaviorSubject<String>.seeded("");
  Stream<String> get userNameStream => _userNameCtrl.stream;
  ValueChanged<String> get onUserNameChanged => _userNameCtrl.sink.add;
  String? get userNameVal => _userNameCtrl.value;

  ///  PasswordController
  final _pwdCtrl = BehaviorSubject<String>.seeded("");
  Stream<String> get pwdStream => _pwdCtrl.stream;
  ValueChanged<String> get onPasswordChanged => _pwdCtrl.sink.add;
  String? get pwdValue => _pwdCtrl.value;

  /// Valid Login
  Stream<bool> get validLogin =>
      Rx.combineLatest2(userNameStream, pwdStream, (username, password) {
        if (Validators.isValidPassword(password as String)) {
          return true;
        }
        return false;
      });

  final _auth = AppAuthService();

  Future<LoginState> loginUserNameWithPwd() async {
    try {
      final loginData = await _auth.loginEmailWithPwd(userNameVal!, pwdValue!);
      // return LoginState.success;
      if (loginData.accessToken != "") {
        return LoginState.success;
      }
      return LoginState.fail;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameCtrl.close();
    _pwdCtrl.close();
  }
}
