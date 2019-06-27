import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xff4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            Text("Messages",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            Text("Utility Bills",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            Text("Funds Transfer",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            Text("Branches",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ],
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : 0.2 * screenHeight,
      bottom: isCollapsed ? 0 : 0.2 * screenWidth,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : 0.4 * screenHeight,
      child: Material(
        elevation: 8,
        color: backgroundColor,
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    Text(
                      "My Cards",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
