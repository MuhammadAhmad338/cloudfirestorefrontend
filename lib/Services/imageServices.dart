// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageServices extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  void pickImage(ImageSource imageSource, BuildContext context) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: imageSource);
      _image = File(pickedImage!.path);
      notifyListeners();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image didnot get pickedUp ${error.toString()}'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        ),
      );
    }
  }
   
    

 

}
