import 'package:flutter/material.dart';

class ColorUtils {
    static Color convertFromHexColor({required String hexColor}) {
        hexColor = hexColor.toUpperCase().replaceAll("#", '');
        if (hexColor.length == 6) {
            hexColor = 'FF' +hexColor;
        }
        int hexValue = int.parse(hexColor, radix: 16);
        return Color(hexValue);
    }
}