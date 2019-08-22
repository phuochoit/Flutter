import 'package:flutter/material.dart';

import 'widget/header.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Headers(title: widget.title),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                children: <Widget>[
                  buildGridView(
                      context, 'He\'d have you all unravel at the', 1),
                  buildGridView(context, 'Heed not the rabble', 2),
                  buildGridView(context, 'Sound of screams but the', 3),
                  buildGridView(context, 'Who scream', 4),
                  buildGridView(context, 'Revolution is coming...', 5),
                  buildGridView(context, 'Revolution, they...', 6),
                  buildGridView(context, "demo 123", 7),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridView(BuildContext context, String title, int index) {
    Color colorindex = Colors.amber;
    if (index == 4) {
      colorindex = Colors.lightBlue[600];
    }

    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: colorindex,
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )));
  }
}
