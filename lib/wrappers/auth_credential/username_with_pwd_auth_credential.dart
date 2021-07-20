import 'auth_credential.dart';

class UserNameWithPwdAuthCredential extends AuthCredential {
  UserNameWithPwdAuthCredential({
    required this.username,
    required this.pwd,
  }) : super(_url);

  static const String _url = '/auth/login';

  @override
  Map<String, String> asMap() {
    return {
      'username': username,
      'password': pwd,
    };
  }

  final String username;

  final String pwd;
}
