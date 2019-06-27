import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  int _radioValue = 0;
  String result = null;
  String userInfo = null;

  void handleRadionOnChange(int value) {
    setState(() {
      _radioValue = value;
    });
    switch (_radioValue) {
      case 0:
        result = "male";
        break;
      case 1:
        result = "female";
        break;
    }
  }

  void onPressedBtn() {
    if (_firstnameController.text.trim().isNotEmpty &&
        _lastnameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _ageController.text.trim().isNotEmpty) {
      if(_radioValue == 0){
        result = 'male';
      }
      userInfo = 'Firt Name: ${_firstnameController.text} '
          'Last Name: ${_lastnameController.text} '
          'Email: ${_emailController.text} '
          'Age: ${_ageController.text} '
          'Sex: ${result}';

      if (_commentController.text.trim().isNotEmpty) {
        userInfo = userInfo + ' Comment: ${_commentController.text}';
      }
    } else {
      userInfo = 'Please record field';
    }

    setState(() {
      userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ui Design App"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
            Center(child: Text("Hello Word!")),
            Container(
              padding: EdgeInsets.only(top: 22.0),
              child: Container(
                padding: EdgeInsets.only(left: 12.0, bottom: 12.0, right: 12.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _firstnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "First Name",
                          hintText: "You First Name please.",
                          icon: Icon(Icons.person)),
                    ),
                    TextField(
                      controller: _lastnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Last Name",
                          hintText: "You Last Name please.",
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "age",
                          hintText: "You age please.",
                          icon: Icon(Icons.date_range)),
                    ),
                    Padding(padding: EdgeInsets.all(22.0)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Male"),
                          Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: handleRadionOnChange,
                            activeColor: Colors.blueAccent,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 22.0),
                            child: Text("Female"),
                          ),
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: handleRadionOnChange,
                            activeColor: Colors.deepOrange,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22.0,
                    ),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "You Email please.",
                          icon: Icon(Icons.email)),
                    ),
                    TextField(
                      controller: _commentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                          labelText: "Comments",
                          hintText: "You Comment please.",
                          icon: Icon(Icons.comment)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                      onPressed: onPressedBtn,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                    ),
                    Text(
                      '$userInfo',
                      style: TextStyle(color: Colors.blue, fontSize: 22.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
