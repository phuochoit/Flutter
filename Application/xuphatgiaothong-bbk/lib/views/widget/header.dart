import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  Headers({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
