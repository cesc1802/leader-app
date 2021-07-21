import 'package:dio/dio.dart';
import 'package:leader_app/features/auth/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  String accessToken = '';
  String refreshToken = '';
  bool isRefreshing = false;

  Dio get getDio =>
      Dio(BaseOptions(baseUrl: 'http://10.0.25.183:3378/appLanhDao/api/v1'));

  factory TokenManager() => _instance;

  TokenManager._internal();

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<void> load(SharedPreferences pref) async {
    accessToken = pref.getString('access_token') ?? '';
    refreshToken = pref.getString('refresh_token') ?? '';
  }

  Future<bool> refresh() async {
    if (isRefreshing) {
      return false;
    }
    isRefreshing = true;
    try {
      final res = await getDio
          .post('/auth/refresh', data: {'refreshToken': refreshToken});

      if (res == null || res.data == null) {
        return false;
      }
      if (res.data is! Map<String, dynamic>) {
        return false;
      }

      final login = Login.fromJSON(res.data);
      accessToken = login.data.accessToken;
      refreshToken = login.data.refreshToken;

      await save();

      isRefreshing = false;
      return true;
    } catch (e) {
      print(e);
    } finally {
      isRefreshing = false;
    }

    return false;
  }

//  Future<bool>revoke() {}
}
