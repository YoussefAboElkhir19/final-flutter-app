// login_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  // Delete the data After Navigate to another page and clean memory
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Check if the form is valid
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Delay
    await Future.delayed(const Duration(seconds: 2));

    // Retrieve stored signup data
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('signupEmail');
    final storedPassword = prefs.getString('signupPassword');

    // check emailInput from login == emailInput from signup
    // check passwordInput from login == passwordInput from signup
    if (_emailController.text == storedEmail &&
        _passwordController.text == storedPassword) {
      await prefs.setBool('isLoggedIn', true);

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      // if Not SignUp
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error !!! email or password Not Found'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email TextFormField
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Password Text Field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Botton To Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      // _isLoading ? null :
                      _login,
                  child:
                  // _isLoading
                  //     ? const CircularProgressIndicator()
                  //     :
                  const Text('Login'),
                ),
              ),
              // Click To Go SignUp Page
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
