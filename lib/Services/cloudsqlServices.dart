// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/userModel.dart';
import 'package:googlecloud/Views/allDogs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CloudsqlServices extends ChangeNotifier {
  Future<void> signIn(UserModel userdata, BuildContext context) async {
    var response = await http.post(Uri.parse("http://localhost:8080/signIn"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: userdata.toJson());
    print(response);
    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);
      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferences.setString("token", responseObject["token"]);

      print("UserData posted successfully! ${responseObject}");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AllDogs()));
    } else {
      print("Request failed with status!");
    }
  }

  Future<void> signUp(UserModel userdata, BuildContext context) async {
    var response = await http.post(Uri.parse("http://localhost:8080/signUp"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: userdata.toJson());
    print(response);
    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);
      print(responseObject);
      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferences.setString("token", responseObject["token"]);

      print("UserData posted successfully! ${responseObject}");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>  AllDogs()));
    } else {
      print("Request failed with status!");
    }
  }

}
