import 'dart:async';

import 'package:taxi/src/firebase/firebase_auth.dart';

class AuthBloc{
  var _firAuth = FirAuth();

  StreamController _userNameController = new StreamController();
  StreamController _userPhoneController = new StreamController();
  StreamController _userEmailController = new StreamController();
  StreamController _userPassController = new StreamController();

  Stream get userNameStream => _userNameController.stream;
  Stream get userPhoneStream => _userPhoneController.stream;
  Stream get userEmailStream => _userEmailController.stream;
  Stream get userPassStream => _userPassController.stream;

  bool isValidSignIn(String email, String pass){
    if(email == null || email.length == 0 || !email.contains("@")){
      _userEmailController.sink.addError("Email Error");
      return false;
    }
    _userEmailController.add("");

    if(pass == null || pass.length == 0 || pass.length < 6){
      _userPassController.sink.addError("Password Error");
      return false;
    }

    _userPassController.add("");
    return true;
  }

  bool isValid(String name, String phone, String email, String pass){

    if(name == null || name.length == 0){
      _userNameController.sink.addError("Name Error");
      return false;
    }
    _userNameController.add("");

    if(phone == null || phone.length == 0 ){
      _userPhoneController.sink.addError("Phone Error");
      return false;
    }
    _userPhoneController.add("");

    if(email == null || email.length == 0 || !email.contains("@")){
      _userEmailController.sink.addError("Email Error");
      return false;
    }
    _userEmailController.add("");

    if(pass == null || pass.length == 0 || pass.length < 6){
      _userPassController.sink.addError("Password Error");
      return false;
    }

    _userPassController.add("");
    return true;

  }

  void signUp(String email, String pass, String name, String phone,  Function onSuccess, Function(String) onRegisterError){
    _firAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
  }

  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError){
    _firAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  
  void dispose(){
    _userNameController.close();
    _userPhoneController.close();
    _userEmailController.close();
    _userPassController.close();
  }
}