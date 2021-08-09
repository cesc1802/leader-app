import 'package:leader_app/features/auth/models/login_data.dart';
import 'package:leader_app/repository/repository.dart';
import 'package:leader_app/wrappers/auth_provider/username_with_password_auth_provider.dart';

import 'app_auth.dart';

class AppAuthService extends Repository {
  final _appAuth = AppAuth();

  Future<LoginData> loginEmailWithPwd(String username, String pwd) async {
    try {
      return _appAuth
          .signInWithCredential(UserNameWithPwdAuthProvider.getCredential(
        username: username,
        password: pwd,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
