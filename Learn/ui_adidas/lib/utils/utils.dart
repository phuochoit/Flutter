import 'package:flutter/material.dart';

double baseHeight = 640.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

TextStyle titleheading(double size, BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontFamily: "Montserrat-Bold",
    fontSize: screenAwareSize(size, context),
  );
}

TextStyle title(double size, BuildContext context) {
  return TextStyle(
      color: Color(0xff949598),
      fontSize: screenAwareSize(size, context),
      fontFamily: "Montserrat-SemiBold");
}

TextStyle descStyle(
    Color color, double size, String fontfamily, BuildContext context) {
  return TextStyle(
      color: color,
      fontSize: screenAwareSize(size, context),
      fontFamily: fontfamily.isNotEmpty ? fontfamily : null);
}


