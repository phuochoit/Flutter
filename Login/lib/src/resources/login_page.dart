import 'package:Login/src/blocs/login_bloc.dart';
import 'package:Login/src/resources/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    LoginBloc bloc = new LoginBloc();
    bool _showPass = false;
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8d)),
                    child: FlutterLogo()),
                ),
                Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                    "Hello \n Welcome Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: StreamBuilder(
                    stream: bloc.userNameStream,
                    builder: (context, snapshot) => TextField(
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            controller: _userController,
                            decoration: InputDecoration(
                                labelText: "User Name",
                                errorText: snapshot.hasError ? snapshot.error : null ,
                                labelStyle: TextStyle(
                                    color: Color(0xff888888), fontSize: 15)),
                        ),
                    )),
                Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                    StreamBuilder(
                        stream: bloc.passWordStream,
                        builder: (context, snapshot) => TextField(
                                style: TextStyle(fontSize: 18, color: Colors.black),
                                obscureText: !_showPass,
                                controller: _passController,
                                decoration: InputDecoration(
                                    labelText: "PassWord",
                                    errorText: snapshot.hasError ? snapshot.error : null,
                                    labelStyle: TextStyle(
                                        color: Color(0xff888888), fontSize: 15)),
                            )),
                    GestureDetector(
                        onTap: onToogleShowPass,
                        child: Text(_showPass ? "HIDE" : "SHOW",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                    )
                    ],
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: onSignInClicked,
                    child: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    ),
                ),
                ),
                Container(
                height: 100,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                        "NEW USER? SIGN UP",
                        style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                    Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                    ],
                ),
                )
            ],
            ),
        ),
        );
    }

    void onToogleShowPass() {
        setState(() {
            _showPass = !_showPass;
        });
    }

    void onSignInClicked() {
        if (bloc.isValidInfo(_userController.text, _passController.text)){
            Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        }
    }

    Widget gotoHome(BuildContext context) {
        return HomePage();
    }
}
