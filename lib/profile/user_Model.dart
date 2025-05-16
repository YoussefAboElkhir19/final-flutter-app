import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile/user.dart';
import 'package:image_picker/image_picker.dart';

class UserModel extends ChangeNotifier {
  // create an instance of image picker
  ImagePicker imagePicker = ImagePicker();

  User? _user;

  // Gett Dta And canot edit in it
  User? get user => _user;

  // Function to select a image
  Future<void> imageSelector(ImageSource source) async {
    // select image and  store image in variable
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      // chech if found user can edit in image
      if (_user != null) {
        _user?.image = File(image!.path);
      } else {
        // ya3ni lo el _user bta3y == null  create new user
        _user = User(
          name: "Youssef",
          Bio: "Programmer . junior flutter",
          image: File(image!.path),
        );
      }

      notifyListeners();
    }
  }

  // Function To Remove Image
  removeImage() {
    // ensure the screen is mounted before calling setState

    _user?.image = null;

    notifyListeners();
  }
}
