// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:http/http.dart' as http;

class DataServices extends ChangeNotifier {
  
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

   Future<void> deleteDogData(int id) async {
    var response = await http.delete(Uri.parse("https://webappoo9.onrender.com/${id}"));
    if (response.statusCode == 200) {
      print("Dogs Data posted deleted successfully"); 
      notifyListeners(); 
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
    notifyListeners();
  }

  static Future<List<DogModel>?> gotAllDogs() async {
    var response = await http.get(Uri.parse("https://webappoo9.onrender.com/"));
    if (response.statusCode == 200) {
      List<dynamic> dogs = jsonDecode(response.body);
      var listOfDogs = dogs.map((dogdata) => DogModel.fromMap(dogdata)).toList();
      
      return listOfDogs;
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
    return null;
  }

}
