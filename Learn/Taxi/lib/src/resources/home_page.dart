import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/src/model/place_items_res.dart';
import 'package:taxi/src/model/step_res.dart';
import 'package:taxi/src/repository/place_service.dart';
import 'package:taxi/src/resources/widget/home_menu.dart';
import 'package:taxi/src/resources/widget/ride_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleMapController _mapController;
  final Map<String, Marker> _markers = <String, Marker>{};
  
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
                      child: RidePicker(onPlaceSelected),
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

    void onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    var mkId = fromAddress ? "from_address" : "to_address";
    _addMarker(mkId, place);
    _moveCamera();
    _checkDrawPolyline();
  }

  void _addMarker(String mkId, PlaceItemRes place) async {
    // remove old
    _markers.remove(mkId);
    _mapController.clearMarkers();

    _markers[mkId] = Marker(
        mkId,
        MarkerOptions(
            position: LatLng(place.lat, place.lng),
            infoWindowText: InfoWindowText(place.name, place.address)));

    for (var m in _markers.values) {
      await _mapController.addMarker(m.options);
    }
  }

  void _moveCamera() {
    print("move camera: ");
    print(_markers);

    if (_markers.values.length > 1) {
      var fromLatLng = _markers["from_address"].options.position;
      var toLatLng = _markers["to_address"].options.position;

      LatLng s, n;
      if (fromLatLng.latitude <= toLatLng.latitude) {
        s = fromLatLng;
        n = toLatLng;
      } else {
        n = fromLatLng;
        s = toLatLng;
      }

      LatLngBounds bounds = LatLngBounds(northeast: n, southwest: s);
      _mapController.moveCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      _mapController.moveCamera(CameraUpdate.newLatLng(
          _markers.values.elementAt(0).options.position));
    }
  }

  void _checkDrawPolyline() {
//  remove old polyline
    _mapController.clearPolylines();

    if (_markers.length > 1) {
      var from = _markers["from_address"].options.position;
      var to = _markers["to_address"].options.position;
      PlaceService.getStep(
              from.latitude, from.longitude, to.latitude, to.longitude)
          .then((vl) {
        List<StepsRes> rs = vl;
        List<LatLng> paths = new List();
        for (var t in rs) {
          paths
              .add(LatLng(t.startLocation.latitude, t.startLocation.longitude));
          paths.add(LatLng(t.endLocation.latitude, t.endLocation.longitude));
        }

//        print(paths);
        _mapController.addPolyline(PolylineOptions(
            points: paths, color: Color(0xFF3ADF00).value, width: 4));
      });
    }
  }
}
