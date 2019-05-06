import 'package:flutter/material.dart';
import 'package:taxi/src/blocs/place_bloc.dart';
import 'package:taxi/src/model/place_items_res.dart';

class RidePickerPage extends StatefulWidget {
  final bool _isFormAddress;
  final String selectedAddress;
  final Function(PlaceItemRes, bool) onSelected;

  RidePickerPage(this.selectedAddress, this.onSelected, this._isFormAddress);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  PlaceBloc placeBloc = new PlaceBloc();
  TextEditingController _ridePickerController = new TextEditingController();

  void initState(){
    _ridePickerController = TextEditingController(text: widget.selectedAddress);
    super.initState();
  }
  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

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
                          onSubmitted: (str) {
                            placeBloc.searchPlace(str);
                          },
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: StreamBuilder(
                      stream: placeBloc.placeStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data.toString());
                          if (snapshot.data == "start") {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<PlaceItemRes> places = snapshot.data;
                          return ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(places.elementAt(index).name),
                                  subtitle:
                                      Text(places.elementAt(index).address),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    var onSelected = onSelected;
                                    Widget.onSelected(places.elementAt(index), widget._isFormAddress);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: Color(0xfff5f5f5),
                                  ),
                              itemCount: places.length);
                        } else {
                          return Container();
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
