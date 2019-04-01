import 'package:flutter/material.dart';
import 'package:whats_app_ui/src/resources/widget/call_tab.dart';
import 'package:whats_app_ui/src/resources/widget/camera_tab.dart';
import 'package:whats_app_ui/src/resources/widget/chats_tab.dart';
import 'package:whats_app_ui/src/resources/widget/status_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(
              text: "CHATS",
            ),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraTab(),
          ChatTab(),
          StatusTab(),
          CallTab(),
        ],
      ),
    );
  }
}


// https://youtu.be/2Tyrofn6zPg?t=863