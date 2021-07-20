import 'dart:async';

class Validators {
  static const emailPattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static bool isValidNormalText(String text) {
    return text != null && text.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    return email != null && RegExp(emailPattern).hasMatch(email);
  }

  static bool isValidPassword(String? pwd) {
    return pwd!.length >= 6;
  }

  final validateNormalText = (String field) =>
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
        sink.add(email);
        if (email.isEmpty) {
          sink.addError('$field is invalid');
        }
      });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (pwd, sink) {
    sink.add(pwd);
    if (!Validators.isValidPassword(pwd)) {
      sink.addError('Password is invalid');
    }
  });

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      var valid = Validators.isValidEmail(email);
      sink.add(email);
      if (!valid) {
        sink.addError('Email is invalid');
      }
    },
  );
}
