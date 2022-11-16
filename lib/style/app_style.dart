
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Colors.white;
  static Color mainColor = Color(0xFF1B202B);
  static Color accentColor = Color(0xFFFFFFFF);

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 28.0, fontWeight: FontWeight.bold, color: mainColor);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.normal);
  
  static TextStyle dateTitle =
      GoogleFonts.nunito(fontSize: 13.0, fontWeight: FontWeight.w500);
}