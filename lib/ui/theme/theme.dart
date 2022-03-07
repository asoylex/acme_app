import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme(){
  return ThemeData(
    primaryColor: Colors.cyan,
    accentColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.notoSans(
        fontSize: 30,
        fontWeight: FontWeight.w200
        ),
      titleMedium: GoogleFonts.notoSans(
        fontSize:20,
      ),
      titleSmall: GoogleFonts.notoSans(
        fontSize: 10,
      ),
    ),
    buttonTheme:  const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
      minWidth: 150,
      height: 40,
    ),

      
  );  
}