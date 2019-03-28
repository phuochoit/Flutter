import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(user.uid, name, phone, onSuccess, onRegisterError);
    }).catchError((error) {
      _onSignUpErr(error.code, onRegisterError);
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((error) {
      onRegisterError("Sigup fail, please try again");
    });
  }

  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError ){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass).then((user){
      onSuccess();
    }).catchError((error){
      onSignInError("Sign In Fail, please try again");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    switch (code) {
      case 'ERROR_INVALID_CREDENTIAL':
      case 'ERROR_INVALID_EMAIL':
        onRegisterError("Invalid email");
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        onRegisterError("Email has existed");
        break;
      case 'ERROR_WEAK_PASSWORD':
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("Sigup fail, please try again");
        break;
    }
  }
}
