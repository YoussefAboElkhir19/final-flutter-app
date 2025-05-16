import 'dart:io';

import 'package:flutter/material.dart';

class options extends StatelessWidget {
  final String title;

  Colors? color;
  final IconData icon;
  File? selectedImage;
  VoidCallback onPressed;
  options({
    // this.color,
    this.selectedImage,
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage != null ? Colors.red : Colors.grey,
          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(
          title,
          style: TextStyle(
            color: selectedImage != null ? Colors.red : Colors.grey,
          ),
        ),
      ],
    );
  }
}
