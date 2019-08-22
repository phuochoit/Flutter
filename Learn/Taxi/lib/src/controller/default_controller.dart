import 'package:flutter/material.dart';

class DefaultController {
  void fieldFocusChange(context, _currentFocus, _nextFocus){
    _currentFocus.unfocus();
    FocusScope.of(context).requestFocus(_nextFocus);
  }
}