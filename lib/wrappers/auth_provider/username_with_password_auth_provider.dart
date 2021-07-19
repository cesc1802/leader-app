import 'package:leader_app/wrappers/auth_credential/auth_credential.dart';
import 'package:leader_app/wrappers/auth_credential/username_with_pwd_auth_credential.dart';

class UserNameWithPwdAuthProvider {
  static AuthCredential getCredential({
    required String username,
    required String password,
  }) {
    return UserNameWithPwdAuthCredential(username: username, pwd: password);
  }
}
