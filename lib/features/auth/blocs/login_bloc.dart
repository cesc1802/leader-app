import 'package:flutter/material.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with Validators {
  final _userNameCtrl = BehaviorSubject<String>.seeded("dev@gmail.com");
  Stream<String> get userNameStream => _userNameCtrl.stream;
  ValueChanged<String> get onUserNameChanged => _userNameCtrl.sink.add;
  String? get userNameVal => _userNameCtrl.value;

  ///  PasswordController
  final _pwdCtrl = BehaviorSubject<String>.seeded("123456");
  Stream<String> get pwdStream => _pwdCtrl.stream;
  ValueChanged<String> get onPasswordChanged => _pwdCtrl.sink.add;
  String? get pwdValue => _pwdCtrl.value;

  /// Valid Login
  Stream<bool> get validLogin =>
      Rx.combineLatest2(userNameStream, pwdStream, (email, pwd) {
        // if (Validators.isValidPassword(pwd)) {
        //   return true;
        // }
        return true;
        return false;
      });

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
