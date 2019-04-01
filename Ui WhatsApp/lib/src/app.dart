import 'package:flutter/material.dart';
import 'package:whats_app_ui/src/resources/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        primaryColor:  new Color(0xff075e54),
        accentColor: new Color(0xff25D366)
      ),
      home: new HomePage(),
    );
  }
}