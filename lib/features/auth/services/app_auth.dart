import 'package:leader_app/features/auth/models/login_data.dart';
import 'package:leader_app/providers/api_provider.dart';
import 'package:leader_app/repository/repository.dart';
import 'package:leader_app/resources/token_manager.dart';
import 'package:leader_app/wrappers/auth_credential/auth_credential.dart';

class AppAuth extends Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<LoginData> signInWithCredential(AuthCredential credential) async {
    try {
      final login = await _signIn(credential);
      await saveData(login!.data);
      return login.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveData(LoginData login) async {
    final tm = TokenManager();
    tm.accessToken = login.accessToken;
    tm.refreshToken = login.refreshToken;
    await tm.save();
  }

  /// Signs in with the given [credential].
  Future<Login?> _signIn(AuthCredential credential) async {
    try {
      final response =
          await _apiProvider.post(credential.url, data: credential.asMap());
      if (response.statusCode == 200) {
        return Login.fromJSON(response.data);
      }
      return null;
    } catch (e) {
      handleError(e);
      // rethrow;
    }
  }
}

class Login {
  final LoginData data;
  final int code;

  Login({
    required this.code,
    required this.data,
  });

  factory Login.fromJSON(Map<String, dynamic> json) {
    return Login(code: 200, data: LoginData.fromJSON(json['data']));
  }
}
