import 'package:flutter/material.dart';

class RidePickerPage extends StatefulWidget {
  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  TextEditingController _ridePickerController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Seacrch  Ride Picker",
          style: TextStyle(fontSize: 16, color: Colors.white),
        )),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 60,
                        child:
                            Center(child: Image.asset("ic_location_black.png")),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: FlatButton(
                            child: Image.asset("ic_remove_x.png"),
                            onPressed: () {
                              _ridePickerController.text = "";
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.0, right: 40.0),
                        child: TextField(
                          controller: _ridePickerController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {},
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
