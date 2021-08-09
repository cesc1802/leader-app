import 'package:flutter/material.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/auth/helper/handler_login_state.dart';
import 'package:leader_app/features/auth/services/app_auth_services.dart';
import 'package:leader_app/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with Validators {
  bool obscureText = true;

  final _userNameCtrl = BehaviorSubject<String>.seeded("");
  Stream<String> get userNameStream => _userNameCtrl.stream;
  ValueChanged<String> get onUserNameChanged => _userNameCtrl.sink.add;
  String? get userNameVal => _userNameCtrl.value;

  ///  PasswordController
  final _pwdCtrl = BehaviorSubject<String>.seeded("");
  Stream<String> get pwdStream => _pwdCtrl.stream;
  ValueChanged<String> get onPasswordChanged => _pwdCtrl.sink.add;
  String? get pwdValue => _pwdCtrl.value;

  /// Show PasswordCtrl
  final _showPasswordCtrl = BehaviorSubject<bool>.seeded(false);
  Stream<String> get showPasswordStream => _pwdCtrl.stream;
  ValueChanged<String> get onShowPasswordChange => _pwdCtrl.sink.add;
  bool? get showPasswordValue => _showPasswordCtrl.value;

  /// Valid Login
  Stream<bool> get validLogin =>
      Rx.combineLatest2(userNameStream, pwdStream, (username, password) {
        if (Validators.isValidPassword(password as String) &&
            Validators.isValidUsername(username as String)) {
          return true;
        }
        return false;
      });

  // Stream<bool> get isShowPassword => pwdStream.map((event) => event.length > 0);

  bool get showPassword {
    return !obscureText;
  }

  final _auth = AppAuthService();

  Future<LoginState> loginUserNameWithPwd() async {
    try {
      isLoadingSink.add(true);
      final loginData = await _auth.loginEmailWithPwd(userNameVal!, pwdValue!);
      // return LoginState.success;
      if (loginData.accessToken != "") {
        return LoginState.success;
      }
      return LoginState.fail;
    } catch (e) {
      rethrow;
    } finally {
      isLoadingSink.add(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameCtrl.close();
    _pwdCtrl.close();
  }
}
