import 'package:flutter/material.dart';
//preferences
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('isLoggedIn');
        await prefs.remove('signupEmail');
        await prefs.remove('signupPassword');
        Navigator.pushReplacementNamed(context, '/login');
      },
      icon: Icon(Icons.logout),
    );
  }
}
