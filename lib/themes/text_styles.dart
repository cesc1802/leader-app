import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // heading 1 => any fonts with fontWeight 700
  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  // heading 2 => any fonts with fontWeight 600
  static TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  // heading 3 => any fonts with fontWeight 400
  static TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
}
