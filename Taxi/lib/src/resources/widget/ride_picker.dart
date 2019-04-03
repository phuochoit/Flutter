import 'package:flutter/material.dart';
import 'package:taxi/src/resources/ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color(0x88999999), offset: Offset(0, 5), blurRadius: 5.0)
          ]),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 32,
            left: 0,
            width: 70,
            height: 40,
            child: Center(child: Image.asset("ic_line.png")),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> RidePickerPage())
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: double.infinity,
                          child: Center(
                            child: Image.asset("ic_location_black.png",
                                alignment: AlignmentDirectional.centerStart),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Text(
                            "16/66 Xuân Diệu, thành phố huế",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff323643)),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Image.asset("ic_remove_x.png",
                                alignment: AlignmentDirectional.centerStart),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: double.infinity,
                          child: Center(
                            child: Image.asset("ic_map_nav.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff323643)),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Image.asset("ic_remove_x.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
