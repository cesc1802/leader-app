import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static void setStyleAppSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  static void setLoadingStyleAppSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color.fromRGBO(0, 0, 0, 0.5),
        systemNavigationBarIconBrightness: Brightness.light));
  }
}