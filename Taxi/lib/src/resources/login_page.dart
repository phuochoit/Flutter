import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Image.asset('logo_car_blue.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                  child: Text("Welcome Back!",
                      style: TextStyle(color: Color(0xff323643), fontSize: 22)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    "Login to continue using iCab",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontSize: 16, color: Color(0xff323643)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: Color(0xff707070), width: 1)),
                        prefixIcon: Container(
                          width: 50,
                          child: Image.asset("ic_mail.png"),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(fontSize: 16, color: Color(0xff323643)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide:
                              BorderSide(color: Color(0xff707070), width: 1),
                        ),
                        prefixIcon: Container(
                          width: 50,
                          child: Image.asset("ic_lock.png"),
                        )),
                  ),
                ),
                Container(
                  constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Forgot password?",
                        style:
                            TextStyle(color: Color(0xff606470), fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: Color(0xff3277D8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: RichText(
                    text: TextSpan(
                        text: "New user? ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff606470)),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                              text: "Sign up for a new account",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff3277D8)))
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
