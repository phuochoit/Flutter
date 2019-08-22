import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.red));
    return MaterialApp(
      title: 'Lỗi Vi Phạm Giao Thông',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Lỗi Vi Phạm Giao Thông '),
    );
  }
}
