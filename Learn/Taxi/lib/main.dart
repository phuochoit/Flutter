import 'package:flutter/material.dart';
import 'package:taxi/src/app.dart';
import 'package:taxi/src/blocs/auth_bloc.dart';
import 'package:taxi/src/resources/login_page.dart';

void main() => runApp(MyApp(
    new AuthBloc(),
    MaterialApp(
      theme: ThemeData(fontFamily: 'SFProDisplay'),
      home: LoginPage(),
    )));
