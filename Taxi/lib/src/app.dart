import 'package:flutter/material.dart';
import 'package:taxi/src/resources/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'SFProDisplay'),
      home :LoginPage(),
    );
  }
}