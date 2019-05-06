import 'dart:async';

import 'package:taxi/src/repository/place_service.dart';

class PlaceBloc {
  var _placeController = new StreamController();

  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyword) {
    _placeController.sink.add("start");
    PlaceService.searchPlace(keyword).then((rs) {
      _placeController.sink.add(rs);
    }).catchError((error) {});
  }

  void dispose() {
    _placeController.close();
  }
}
