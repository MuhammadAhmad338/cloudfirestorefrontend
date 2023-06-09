// ignore_for_file: file_names, avoid_print, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Views/allDogs.dart';
import 'package:http/http.dart' as http;
import '../Models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataServices extends ChangeNotifier {
  bool _isSigningIn = false;
  bool get signIn => _isSigningIn;
  set isSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  static Future<void> getDogsData() async {
    var response = await http.get(Uri.parse('https://webappoo9.onrender.com/'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }

  static Future<void> addDogs(DogModel dog) async {
    var response = await http.post(Uri.parse("https://webappoo9.onrender.com/"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: dog.toJson());
    if (response.statusCode == 200) {
      print("Dog Data posted successfully!");
    } else {
      print("Request faield with status: ${response.statusCode}");
    }
  }

  static Future<DogModel?> getSingleDog(String name) async {
    var response =
        await http.get(Uri.parse("https://webappoo9.onrender.com/${name}"));
    if (response.statusCode == 200) {
      DogModel dogModel = DogModel.fromJson(response.body);
      return dogModel;
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
    return null;
  }

  static Future<void> deleteDogData(int id) async {
    var response =
        await http.delete(Uri.parse("https://webappoo9.onrender.com/${id}"));
    if (response.statusCode == 200) {
      print("Dogs Data posted deleted successfully");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }

  static Future<List<DogModel>?> gotAllDogs() async {
    var response = await http.get(Uri.parse("https://webappoo9.onrender.com/"));
    if (response.statusCode == 200) {
      List<dynamic> dogs = jsonDecode(response.body);
      var listOfDogs =
          dogs.map((dogdata) => DogModel.fromMap(dogdata)).toList();

      return listOfDogs;
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
    return null;
  }

  Future<void> createUser(
      UserModel userdata, String? token, BuildContext context) async {
    var response = await http.post(
        Uri.parse("https://webappoo9.onrender.com/signUp"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: userdata.toJson());
    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);

      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferences.setString("token", responseObject["token"]);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AllDogs(
                token: token,
              )));
    } else {
      print("Request failed with status!");
    }
  }

  Future<void> signInUser(
      UserModel userdata, String? token, BuildContext context) async {
    var response = await http.post(
        Uri.parse("https://webappoo9.onrender.com/signIn"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: userdata.toJson());

    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);

      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferences.setString("token", responseObject["token"]);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AllDogs(
                token: token,
              )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Invalid Credentials'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              ),
            ); 
    }
  }

  Future<void> forgetPassword(UserModel userModel,BuildContext context) async {
    var response = await http.post(
        Uri.parse("https://webappoo9.onrender.com/forgetpassword"),
        headers: {
          'Content-Type': 'application/json',
        }, body: userModel.toJson());
    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);
     ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${responseObject["status"]}'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              ),
            ); 
    }
     
  }


  Future<UserModel?> myUsers(String? token) async {
    var response = await http
        .get(Uri.parse("https://webappoo9.onrender.com/myusers"), headers: {
      'Content-Type': 'application/json',
      'authorization': '${token}'
    });
    if (response.statusCode == 200) {
      var responseObject = jsonDecode(response.body);
      UserModel userModel = UserModel.fromMap(responseObject);

      return userModel;
    }
    return null;
  }

  Future<List<UserModel>?> alltheUsers(String? token) async {
    var response = await http
        .get(Uri.parse("https://webappoo9.onrender.com/alltheUsers"), headers: {
      'Content-Type': 'application/json',
      'authorization': '${token}'
    });
    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      var usersData =
          users.map((usersData) => UserModel.fromMap(usersData)).toList();
      return usersData;
    }
    return null;
  }

  static Future<void> signOut() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.remove("token");
  }
}
