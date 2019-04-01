import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/src/resources/widget/home_menu.dart';
import 'package:taxi/src/resources/widget/ride_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.4746),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Center(
                        child: Text(
                          "Taxi App",
                          style: TextStyle(color: Color(0xff323643)),
                        ),
                      ),
                      leading: FlatButton(
                        onPressed: () {
                          // Scaffold.of(context).openDrawer();
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset("ic_menu.png"),
                      ),
                      actions: <Widget>[Image.asset("ic_notify.png")],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: RidePicker(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
