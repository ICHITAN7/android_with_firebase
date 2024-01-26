import 'package:flutter/material.dart';

TextStyle customStyleH1 =const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
TextStyle customStyleH2 =const TextStyle(
    fontSize: 35,
    color: Colors.black,
  );
TextStyle customStyleP =const TextStyle(
    fontSize: 25,
    color: Colors.black,
  );
TextStyle customStylePWhite =const TextStyle(
    fontSize: 25,
    color: Colors.white,
  );
TextStyle customStyleBodyp =const TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
TextStyle customStyleBodyh1 =const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
TextStyle customStyleTitle = const TextStyle(
  fontSize: 25,
  color: Colors.black,
  fontWeight: FontWeight.bold
);
class HTextTheme{
  HTextTheme._();
  static TextTheme lighTextTheme = TextTheme();
  static TextTheme darkTextTheme = TextTheme();
}
