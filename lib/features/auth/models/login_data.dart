class LoginData {
  final String accessToken;
  final int? expiry;
  final String refreshToken;

  LoginData({
    required this.accessToken,
    this.expiry,
    required this.refreshToken,
  });

  factory LoginData.fromJSON(Map<String, dynamic> json) {
    return LoginData(
      accessToken: json['accessToken'],
      expiry: json['expiry'] ?? 0,
      refreshToken: json['refreshToken'],
    );
  }
}
