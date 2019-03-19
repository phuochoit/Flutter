import 'package:flutter/material.dart';
import 'package:stream/my_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBloc bloc = new MyBloc();

  void dispose(){
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    bloc.counterStream.listen((data){
      print(data.toString());
    });

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Strean")),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<Object>(
              stream: bloc.counterStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? snapshot.data.toString() : '0',
                  style: TextStyle(fontSize: 30, color: Colors.redAccent),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
