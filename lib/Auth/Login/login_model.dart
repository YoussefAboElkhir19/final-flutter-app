import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('signupEmail');
    final storedPassword = prefs.getString('signupPassword');
    // check with values  from signup to login by it
    if (email == storedEmail && password == storedPassword) {
      await prefs.setBool('isLoggedIn', true);
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('isLoggedIn');
  // }
}
