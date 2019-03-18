import 'dart:async';

import 'package:demoapp/src/validators/validator.dart';

class LoginBloc {
    StreamController _userController = new StreamController();
    StreamController _passController = new StreamController();

    Stream get userNameStream => _userController.stream;
    Stream get passWordStream => _passController.stream;

    bool isValidInfo( String userName, String passWord){
        // bool flag =true;
        if(!Validator.isValidUser(userName)){
            _userController.sink.addError("User Name error!");
            return false;
            // flag =  false;
        }
        if(!Validator.isValidPass(passWord)){
            _passController.sink.addError("PassWord Error!");
            return false;
            // flag = false;
        }
        _userController.sink.add("OK");
        _passController.sink.add("OK");
        return true;
        // return flag;
    }


    void dispose(){
        _userController.close();
        _passController.close();
    }
}