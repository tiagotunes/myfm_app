import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfm/configs/color.dart';
import 'package:myfm/configs/size.dart';

const systemUiOverlayStyle = SystemUiOverlayStyle(
  // Status bar color set to transperent
  statusBarColor: Colors.transparent,
  // Set brightness for icons
  statusBarIconBrightness: Brightness.light,
);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    titleLarge: GoogleFonts.getFont(
      'Libre Franklin',
      color: Colors.white,
      fontSize: getProportionateScreenWidth(40),
      fontWeight: FontWeight.w900,
    ),
    labelLarge: GoogleFonts.getFont(
      'Libre Franklin',
      color: Colors.white,
      fontSize: getProportionateScreenWidth(20),
      fontWeight: FontWeight.bold,
    ),
  );
}
