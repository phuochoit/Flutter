import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xff4A4A58);

class MenuDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
        ],
      ),
    );
  }
}

Widget menu(context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("Messages", style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("Utility Bills",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("Funds Transfer",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("Branches", style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    ),
  );
}
