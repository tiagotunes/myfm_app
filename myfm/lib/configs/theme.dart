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
    appBarTheme: AppBarTheme(
        backgroundColor: kBackgroundColor,
        titleTextStyle: textTheme().titleLarge,
        iconTheme: const IconThemeData(color: Colors.white)),
  );
}

TextTheme textTheme() {
  return TextTheme(
      headlineLarge: GoogleFonts.getFont(
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
      titleLarge: GoogleFonts.getFont(
        'IBM Plex Sans',
        color: Colors.white,
        fontSize: getProportionateScreenWidth(18),
        fontWeight: FontWeight.bold,
      ));
}
