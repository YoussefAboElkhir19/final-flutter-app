import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final String uri;
  ButtonWidget({required this.text, required this.uri, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, uri);
      },

      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
