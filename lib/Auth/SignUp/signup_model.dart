// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  // Method to SignUp Type boolean
  Future<bool> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return false;
    }

    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('signupName', name);
    await prefs.setString('signupEmail', email);
    await prefs.setString('signupPassword', password);

    _isLoading = false;
    notifyListeners();

    return true;
  }
}
