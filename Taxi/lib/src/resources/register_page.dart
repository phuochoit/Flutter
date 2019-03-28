import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/src/blocs/auth_bloc.dart';
import 'package:taxi/src/controller/default_controller.dart';
import 'package:taxi/src/resources/dialog/loading_dialog.dart';
import 'package:taxi/src/resources/dialog/msg_dialog.dart';
import 'package:taxi/src/resources/home_page.dart';
import 'package:taxi/src/resources/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();
  DefaultController defaultController = new DefaultController();

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userPhoneController = new TextEditingController();
  TextEditingController _userEmailController = new TextEditingController();
  TextEditingController _userPassController = new TextEditingController();
  FocusNode _nameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passFocus = FocusNode();
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Color(0xff3277D8)),
      //   elevation: 0,
      // ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image.asset("logo_car_red.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Welcome Aboard!",
                    style: TextStyle(fontSize: 22, color: Color(0xff323643))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 80),
                child: Text(
                  "Signup with iCab in simple steps",
                  style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: StreamBuilder<Object>(
                    stream: authBloc.userNameStream,
                    builder: (context, snapshot) {
                      return TextField(
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff323643)),
                        controller: _userNameController,
                        textInputAction: TextInputAction.next,
                        focusNode: _nameFocus,
                        onSubmitted: (term) => defaultController
                            .fieldFocusChange(context, _nameFocus, _phoneFocus),
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 16, color: Color(0xff323643)),
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              child: Image.asset("ic_user.png"),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                    color: Color(0xff707070), width: 1))),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: StreamBuilder<Object>(
                    stream: authBloc.userPhoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff323643)),
                          controller: _userPhoneController,
                          textInputAction: TextInputAction.next,
                          focusNode: _phoneFocus,
                          onSubmitted: (term) =>
                              defaultController.fieldFocusChange(
                                  context, _phoneFocus, _emailFocus),
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: Color(0xff323643)),
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset("ic_shape.png"),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  borderSide: BorderSide(
                                      color: Color(0xff707070), width: 1))));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: StreamBuilder<Object>(
                    stream: authBloc.userEmailStream,
                    builder: (context, snapshot) {
                      return TextField(
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff323643)),
                          controller: _userEmailController,
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          onSubmitted: (term) =>
                              defaultController.fieldFocusChange(
                                  context, _emailFocus, _passFocus),
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: Color(0xff323643)),
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset("ic_mail.png"),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  borderSide: BorderSide(
                                      color: Color(0xff707070), width: 1))));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: StreamBuilder<Object>(
                    stream: authBloc.userPassStream,
                    builder: (context, snapshot) {
                      return TextField(
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff323643)),
                          obscureText: true,
                          controller: _userPassController,
                          textInputAction: TextInputAction.done,
                          focusNode: _passFocus,
                          decoration: InputDecoration(
                              labelText: "PassWord",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: Color(0xff323643)),
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset("ic_lock.png"),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  borderSide: BorderSide(
                                      color: Color(0xff707070), width: 1))));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: onSignupClicked,
                    child: Text("Signup",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: RichText(
                  text: TextSpan(
                      text: "Already a User? ",
                      style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          text: "Login now",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff3277D8)),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSignupClicked() {
    var isValid = authBloc.isValid(
        _userNameController.text,
        _userPhoneController.text,
        _userEmailController.text,
        _userPassController.text);
    if (isValid) {
      // create user
      //loading dialog
      LoadingDialog.showLoadingDialog(context, "Loading...");
      authBloc.signUp(_userEmailController.text, _userPassController.text,
          _userNameController.text, _userPhoneController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }, (msg) {
        // show messeage dialog
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Sign-In", msg);
      });
    }
  }
}
