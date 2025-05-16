import 'dart:io';

class User {
  String name;
  String Bio;
  File? image;

  // Constructor
  User({required this.name, required this.Bio, this.image});
}
