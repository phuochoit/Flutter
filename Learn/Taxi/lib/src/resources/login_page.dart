import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/src/app.dart';
import 'package:taxi/src/controller/default_controller.dart';
import 'package:taxi/src/resources/dialog/loading_dialog.dart';
import 'package:taxi/src/resources/dialog/msg_dialog.dart';
import 'package:taxi/src/resources/home_page.dart';
import 'package:taxi/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DefaultController defaultController = new DefaultController();
  TextEditingController _userEmailController = new TextEditingController();
  TextEditingController _userPassController = new TextEditingController();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passFocus = FocusNode();
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
                    controller: _userEmailController,
                    style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocus,
                    onSubmitted: (term) => defaultController.fieldFocusChange(
                        context, _emailFocus, _passFocus),
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
                    controller: _userPassController,
                    style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                    obscureText: true,
                    focusNode: _passFocus,
                    textInputAction: TextInputAction.done,
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
                      onPressed: onSignInClicked,
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

  void onSignInClicked() {
    String email = _userEmailController.text;
    String pass = _userPassController.text;

    var authBloc = MyApp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    authBloc.signIn(email, pass, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign In", msg);
    });
  }
}
