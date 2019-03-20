import 'package:flutter/material.dart';
import 'package:taxi/src/resources/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home :LoginPage(),
    );
  }
}