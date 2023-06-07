// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInUser(String email, String password) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance(); 
    if (email.isNotEmpty && password.isNotEmpty) {
      await _sharedPreferences.setString("login", "true");
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    }
    return null;
  }

  Future<UserCredential?> creatingUser(String email, String password) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance(); 
    if (email.isNotEmpty && password.isNotEmpty) {
      await _sharedPreferences.setString("login", "true");
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
    return null;
  }

  Future<void> signedOut() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance(); 
     _auth.signOut();
     _sharedPreferences.remove("login");
  }
  
}
