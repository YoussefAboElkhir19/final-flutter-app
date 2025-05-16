import 'package:flutter/material.dart';

class MyPhotos extends StatelessWidget {
  final String url;
  final String text;
  MyPhotos({required this.url, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Photo with rounded corners and shadow
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(
                url,
              ), // Ensure the image is in your assets folder
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Text overlay with background
        Positioned(
          bottom: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
