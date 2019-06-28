import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  Future<List> getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}

class _HomeState extends State<Home> {
  var home = Home();
  List data;
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    getDataResponse();
  }

  void getDataResponse() async {
    data = await (home.getData());
    setState(() {
      data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Api Json")),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int position) {
            if (position.isEven) return Divider();
            final int newPosition = position ~/ 2;
            return ListTile(
              title: Text(
                data[position]['title'], //${data[position].title}
                style:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 22.0),
              ),
              subtitle: Text(
                data[position]['body'], //${data[position].title}
                style:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 14.0),
              ),
              leading: CircleAvatar(
                child: Text("P ${data[position]['id']}"),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              onTap: () => showMoreInfo(
                  context, data[position]['title'], data[position]['body']),
            );
          },
        ),
      )),
    );
  }

  showMoreInfo(BuildContext context, String title, String body) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${title}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$body'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
