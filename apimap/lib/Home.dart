import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  Future<Map> getData() async {
    String url =
        "https://api.apixu.com/v1/current.json?key=db6463fe7c2c4d158d770633192806&q=Paris";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}

class _HomeState extends State<Home> {
  var home = Home();
  Map data;
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    getDataResponse();
  }

  void getDataResponse() async {
    data = await (home.getData());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("API MAP"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 22.0),
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 55.0)),
              Text(
                'Name: ${data['location']['name']}',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent, fontSize: 22.5),
              ),
              Text(
                'Region: ${data['location']['region']}',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent, fontSize: 22.5),
              ),
              Text(
                'Country: ${data['location']['country']}',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent, fontSize: 22.5),
              ),
              Text(
                'localtime epoch: ${data['location']['localtime_epoch']}',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent, fontSize: 22.5),
              ),
              Text(
                'localtime: ${data['location']['localtime']}',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent, fontSize: 22.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
