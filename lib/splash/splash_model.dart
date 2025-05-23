import 'package:flutter/material.dart';

class SplashModel extends ChangeNotifier {
  //  method  used to navigate to the login screen
  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  //  method used to navigate to the sign-up screen
  void navigateToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/signup');
  }
}
