import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/item.dart';
import 'package:image_picker/image_picker.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;
  // function to add item to list
  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  // create an instance of image picker
  ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage = [];

  // Function to select a image
  Future<void> imageSelector() async {
    // select image and  store image in variable
    List<XFile>? images = await imagePicker.pickMultiImage();

    if (images != null) {
      // All Files save in List
      selectedImage!.addAll(
        images.map((toElement) => File(toElement!.path)).toList(),
      );
      notifyListeners();
    }
  }

  void removeImage(index) {
    selectedImage!.removeAt(selectedImage!.indexOf(index));
    notifyListeners();
  }

  // Function to Selected Data of item
  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;
  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
}
