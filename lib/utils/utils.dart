import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static void setStyleAppSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  // đoạn code này em đi copy nên cũng chưa hiểu lắm. hình như nó sẽ ẩn cái bottom nav đi khi loading
  static void setLoadingStyleAppSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //Set màu cua status bar. (Thanh trạng thái trên cùng)
      statusBarColor: Colors.transparent,
      //Set màu của cái bả điều hướng dưới cùng
      systemNavigationBarColor: Color.fromRGBO(0, 0, 0, 0.5),
      //Brightnes light thì text hoặc icon màu dark, ngược lại
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
}
