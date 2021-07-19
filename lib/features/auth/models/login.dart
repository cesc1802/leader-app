import 'login_data.dart';

class Login {
  final LoginData data;

  Login({
    required this.data,
  });

  factory Login.fromJSON(Map<String, dynamic> json) {
    int code = json['code'];
    var data;
    if (code == 200) {
      data = LoginData.fromJSON(json['data']);
    }
    return Login(data: data);
  }
}
