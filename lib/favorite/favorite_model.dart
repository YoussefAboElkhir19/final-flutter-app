import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/item.dart';

class FavoriteModel extends ChangeNotifier {
  //
  final List<Item> _fav = [];

  List<Item> get fav => _fav;

  // funation to add item to fav List
  addToFav(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item);
    }
    notifyListeners();
  }

  // funation to Remove item to fav List
  removeToFav(Item item) {
    // ya3ni  if item da mawgood fe el fav list 3ml remove
    if (_fav.contains(item)) {
      _fav.remove(item);
    }
    notifyListeners();
  }

  // function check  if clicked on favorite icon or not
  isFavorite(Item item) {
    // set value of favorite == false
    item.favorite = !item.favorite;
    // if favorite == true add to fav list
    // if favorite == false remove from fav list
    item.favorite ? addToFav(item) : removeToFav(item);
    notifyListeners();
  }
}
