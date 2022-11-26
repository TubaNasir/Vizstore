import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(primary: PrimaryColor),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      //appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme());
}

TextTheme textTheme() {
  return TextTheme(
      headlineSmall: TextStyle(color: TextColor1, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: TextColor1),//
      bodyMedium: TextStyle(color: TextColor1),//for price for now// for price for now
      bodySmall: TextStyle(color: TextColor2),
      bodyLarge: TextStyle(color: TextColor1),
  );
}

/*AppBarTheme appBarTheme() {
  return AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: TextColor, fontSize: 18),
    ).headline6,

  );
}*/

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: TextColor2),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    //floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}